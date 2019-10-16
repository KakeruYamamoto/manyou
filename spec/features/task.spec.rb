require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    @task = FactoryBot.create(:task)
    @task2 = FactoryBot.create(:second_task)
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
    visit tasks_path
    s = all('td')[1].native.to_s
    expect(s).to eq '<td>Factoryで作ったデフォルトのコンテント２</td>'
  end
end