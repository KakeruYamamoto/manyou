require 'rails_helper'
require 'byebug'
# bin/rspec spec/features/task.spec.rb
RSpec.feature "タスク管理機能", type: :feature do
  background do
    @task = FactoryBot.create(:task)
    @task2 = FactoryBot.create(:second_task)
    @task3 = FactoryBot.create(:third_task)
    @task4 = FactoryBot.create(:fourth_task)
    @task5 = FactoryBot.create(:fifth_task)
  end

  scenario "タスク一覧のテスト" do
    visit tasks_path

    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path

    fill_in "task_title", with: 'testtesttest'
    fill_in 'task_content', with: 'samplesample'

    click_on '登録する'

    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  scenario "タスク詳細のテスト" do
    visit task_path(@task.id)

    expect(page).to have_content @task.title
    expect(page).to have_content @task.content
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    # s = all('td')[1].native.to_s
    # expect(s).to have_selector td[1], text: 'testtesttest3'
    # save_and_open_page
    visit tasks_path
    all('tr')[1].click_link '詳細'
    expect(page).to have_content 'testtesttest5'

    visit tasks_path
    all('tr')[2].click_link '詳細'
    expect(page).to have_content 'testtesttest4'

    visit tasks_path
    all('tr')[3].click_link '詳細'
    expect(page).to have_content 'testtesttest3'

  end

  scenario "終了期限登録のテスト" do
    visit new_task_path

    fill_in "task_title", with: 'testtesttest'
    fill_in 'task_content', with: 'samplesample'
    select '2019', from: 'task_deadline_1i'
    select '11', from: 'task_deadline_2i'
    select '11', from: 'task_deadline_3i'
    select '11', from: 'task_deadline_4i'
    select '11', from: 'task_deadline_5i'

    click_on '登録する'

    expect(page).to have_content '2019年11月11日 11時11分'
  end

  scenario "一覧画面で終了期限でソートテスト" do
    visit tasks_path
    click_link '終了期限でソート'
    all('tr')[1].click_link '詳細'
    expect(page).to have_content 'testtesttest5'

    visit tasks_path
    click_link '終了期限でソート'
    all('tr')[2].click_link '詳細'
    expect(page).to have_content 'testtesttest4'

    visit tasks_path
    click_link '終了期限でソート'
    all('tr')[3].click_link '詳細'
    expect(page).to have_content 'testtesttest3'
  end

  scenario "タスクをステータスで絞り込みのテスト" do
    visit tasks_path
    select '完了', from: 'task_status'
    click_on '上記の条件で検索'
    expect(page).to have_content 'testtesttest2'
  end

  scenario "一覧画面で優先順位でソートテスト" do
    visit tasks_path
    click_link '優先順位でソート'
    all('tr')[1].click_link '詳細'
    expect(page).to have_content 'testtesttest3'

    visit tasks_path
    click_link '優先順位でソート'
    all('tr')[2].click_link '詳細'
    expect(page).to have_content 'testtesttest2'

    visit tasks_path
    click_link '優先順位でソート'
    all('tr')[3].click_link '詳細'
    expect(page).to have_content 'testtesttest5'
  end
end