require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do

  scenario "タスク一覧のテスト" do
    @task = Task.create!(title: 'test_task_01', content: 'testtesttest')
    Task.create!(title: 'test_task_02', content: 'samplesample')

    visit tasks_path
    # save_and_open_page
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path

    fill_in "task_title", with: 'testtesttest'
    fill_in 'task_content', with: 'samplesample'

    click_on 'Create Task'

    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  scenario "タスク詳細のテスト" do
    @task = Task.create!(title: 'test_task_01', content: 'testtesttest')
    @task2 = Task.create!(title: 'test_task_02', content: 'samplesample')
    visit task_path(@task.id)

    expect(page).to have_content @task.title
    expect(page).to have_content @task.content
    expect(page).not_to have_content @task2.title
    expect(page).not_to have_content @task2.content
  end
end