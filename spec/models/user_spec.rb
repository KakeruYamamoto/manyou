require 'rails_helper'
# bin/rspec spec/models/user_spec.rb
RSpec.describe User, type: :model do
  it "emailが空ならバリデーションが通らない" do
    user = User.new(name: '失敗テスト', email: '', password_digest: '111111')
    expect(user).not_to be_valid
  end

  it "emailが形式が違ったらバリデーションが通らない" do
    user = User.new(name: '失敗テスト', email: 'failure', password_digest: '111111')
    expect(user).not_to be_valid
  end

  it "passwordが6文字以下ならバリデーションが通らない" do
    user = User.new(name: '成功テスト', email: 'failure@f.com', password_digest: '1')
    expect(user).not_to be_valid
  end
end
