require 'rails_helper'
require 'byebug'
# bin/rspec spec/features/user.spec.rb
# save_and_open_page
RSpec.feature "ユーザーログイン機能", type: :feature do
  background do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:second_user)
    @user3 = FactoryBot.create(:third_user)
    @user4 = FactoryBot.create(:fourth_user)
    @user5 = FactoryBot.create(:fifth_user)
    @admin = FactoryBot.create(:admin_user)
  end
  feature "ログイン前" do
    scenario "ユーザー登録のテスト&登録したらそのままログインするテスト" do
      visit new_user_path

      fill_in "user_name", with: 'user6'
      fill_in 'user_email', with: 'user6@test.com'
      fill_in 'user_password', with: 'password6'
      fill_in 'user_password_confirmation', with: 'password6'
      click_on '登録する'
      expect(page).to have_content 'user6'
    end

    scenario "未ログインでサービスのページに飛ぼうとした場合、ログインページに遷移するテスト" do
      visit tasks_path
      expect(page).to have_content 'ログインが必要です'
    end
  end

  feature "ログイン後" do
    background do # 事前ログイン
      visit new_session_path
      fill_in 'session_email', with: 'user1@test.com'
      fill_in 'session_password', with: 'password1'
      click_on 'Log in'
    end

    scenario "ログインのテスト" do
      expect(page).to have_content 'user1'
    end

    scenario "ログアウトのテスト" do
      click_on 'Logout'
      expect(page).to have_content "ログアウトしました"
    end

    scenario "自分以外のユーザページに行かせないテスト" do
      visit users_path
      all('tr td')[9].click_link ''
      expect(page).to have_content "権限がありません"
    end

    scenario "ログイン時、ユーザ登録画面に行かせないテスト" do
      visit new_user_path
      expect(page).to have_content "ログアウトしてください"
    end
  end

  feature "管理機能のテスト" do
    background do # 管理者事前ログイン
      visit new_session_path
      fill_in 'session_email', with: 'admin@test.com'
      fill_in 'session_password', with: 'adminpass'
      click_on 'Log in'
    end
    scenario "管理者のユーザ一覧テスト" do
      visit admin_users_path
      expect(page).to have_content "Administrator"
      expect(page).to have_content "Admin"
      expect(page).to have_content "Common"
      expect(page).to have_content "user1"
    end
    scenario "管理者のユーザ作成テスト" do
      visit new_admin_user_path
      fill_in 'user_name', with: 'admin2'
      fill_in 'user_email', with: 'admin2@test.com'
      fill_in 'user_password', with: 'admin2pass'
      fill_in 'user_password_confirmation', with: 'admin2pass'
      click_on '登録する'
      expect(page).to have_content "admin2"
      expect(page).to have_content "admin2@test.com"
      expect(page).to have_content "false"
    end
    scenario "管理者のユーザ詳細テスト" do
      visit admin_user_path(@admin.id)
      expect(page).to have_content "admin"
      expect(page).to have_content "admin@test.com"
      expect(page).to have_content "true"
    end
    scenario "管理者のユーザ編集テスト" do
      visit edit_admin_user_path(@user.id)
      fill_in 'user_password', with: 'useradmin'
      fill_in 'user_password_confirmation', with: 'useradmin'
      check 'user_admin'
      click_on '更新する'
      expect(page).to have_content "user1"
      expect(page).to have_content "user1@test.com"
      expect(page).to have_content "true"
    end
    scenario "管理者のユーザ削除テスト" do
      visit admin_users_path
      all('tr td')[7].click_link ''
      expect(page).to have_content "削除しました"
    end
  end
end