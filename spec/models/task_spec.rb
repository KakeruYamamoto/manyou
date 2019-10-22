require 'rails_helper'
# bin/rspec spec/models/task_spec.rb
RSpec.describe Task, type: :model do

  it "titleが空ならバリデーションが通らない" do
    task = Task.new(title: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    task = Task.new(title: '失敗テスト', content: '')
    expect(task).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    task = Task.new(title: '成功テスト', content: '成功テスト')
    expect(task).to be_valid
  end

  describe "scope" do
    it "modelに記載したscopeによる絞りこみを確かめる" do
      expect(Task.title_scope("title = test")).to_not include(Task.where("title = test"))
    end
  end
end