# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == "development"
  10.times do |i|
    Task.create!(title: "test#{i + 1}", content: "test#{i + 1}", status: "未着手", deadline: "#{Time.zone.today + 1}")
  end
  10.times do |i|
    Task.create!(title: "test#{i + 10}", content: "test#{i + 10}", status: "着手", deadline: "#{Time.zone.today + 2}")
  end
  10.times do |i|
    Task.create!(title: "test#{i + 20}", content: "test#{i + 20}", status: "完了", deadline: "#{Time.zone.today + 3}")
  end
end