# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == "development"
  # 6.times do |i|
  #   User.create!(name: "user#{i + 1}", email: "user#{i + 1}@test.com", password: "user#{i + 1}@test.com", password_confirmation: "user#{i + 1}@test.com")
  # end
  3.times do |i|
    Task.create!(title: "test#{i + 1}", content: "test#{i + 1}", status: "未着手", deadline: "#{Time.zone.today + 1}", priority: 0, user_id: 1)
  end
  4.times do |i|
    Task.create!(title: "test#{i + 10}", content: "test#{i + 10}", status: "着手中", deadline: "#{Time.zone.today + 2}", priority: 1, user_id: 2)
  end
  5.times do |i|
    Task.create!(title: "test#{i + 20}", content: "test#{i + 20}", status: "完了", deadline: "#{Time.zone.today + 3}", priority: 2, user_id: 3)
  end
  3.times do |i|
    Task.create!(title: "test#{i + 1}", content: "test#{i + 1}", status: "完了", deadline: "#{Time.zone.today + 4}", priority: 1, user_id: 4)
  end
  4.times do |i|
    Task.create!(title: "test#{i + 10}", content: "test#{i + 10}", status: "着手中", deadline: "#{Time.zone.today + 5}", priority: 2, user_id: 5)
  end
  5.times do |i|
    Task.create!(title: "test#{i + 20}", content: "test#{i + 20}", status: "未着手", deadline: "#{Time.zone.today + 6}", priority: 0, user_id: 6)
  end
end