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
    user = User.new(name: '成功テスト', email: 'success@s.com', password_digest: '111111')
    task = Task.new(title: '成功テスト', content: '成功テスト', deadline: Time.zone.today, status: '未着手', priority: 0, user: User.first || user )
    expect(task).to be_valid
  end

  describe "scope" do
    it "modelに記載したscopeによる絞りこみを確かめる" do
      expect(Task.title_scope("title = test")).to_not include(Task.where("title = test"))
    end
  end
end