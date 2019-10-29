require 'rails_helper'
require 'byebug'
# bin/rspec spec/features/label.spec.rb
RSpec.feature "ラベル管理機能", type: :feature do
  background do #事前ログイン
    @label = FactoryBot.create(:label)
    @label2 = FactoryBot.create(:label2)
    @label3 = FactoryBot.create(:label3)
    @label4 = FactoryBot.create(:label4)
    @label5 = FactoryBot.create(:label5)
    @task = FactoryBot.create(:task)
    @taskB = FactoryBot.create(:taskB)
    @taskC = FactoryBot.create(:taskC)
    @task2 = FactoryBot.create(:second_task)
    @task3 = FactoryBot.create(:third_task)
    @task4 = FactoryBot.create(:fourth_task)
    @task5 = FactoryBot.create(:fifth_task)
    visit new_session_path
    fill_in 'session_email', with: 'user1@test.com'
    fill_in 'session_password', with: 'password1'
    click_on 'Log in'
  end

  scenario "作成時ラベルをつけるテスト&詳細画面で紐づくラベル一覧を出すテスト" do
    visit new_task_path
    fill_in "task_title", with: 'testtesttest'
    fill_in 'task_content', with: 'samplesample'
    check 'task_label_ids_1'
    check 'task_label_ids_2'
    click_on '登録する'
    expect(page).to have_content 'Rails'
    expect(page).to have_content 'Ruby'
  end

  scenario "編集時ラベルをつけるテスト" do
    visit tasks_path
    all('tr td')[7].click_link ''
    check 'task_label_ids_8'
    click_on '更新する'
    expect(page).to have_content 'HTML'
  end

  scenario "ラベルで絞り込みするテスト" do
    visit tasks_path
    all('tr td')[7].click_link ''
    check 'task_label_ids_12'
    click_on '更新する'
    select 'Ruby', from: 'task_label_id'
    click_on '上記の条件で検索'
    expect(page).to have_content 'testtesttestC'
    expect(page).to have_content 'Ruby'
  end
end