require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    @task = FactoryBot.create(:task)
    @task2 = FactoryBot.create(:second_task)
    @task3 = FactoryBot.create(:third_task)
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
    all('tr td')[3].click_link '詳細'
    expect(page).to have_content 'testtesttest3'

    visit tasks_path
    all('tr td')[9].click_link '詳細'
    expect(page).to have_content 'testtesttest2'

    visit tasks_path
    all('tr td')[15].click_link '詳細'
    expect(page).to have_content 'testtesttest'

  end
end