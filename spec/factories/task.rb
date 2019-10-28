FactoryBot.define do

  factory :task do
    title { 'testtesttestA' }
    content { 'samplesampleA' }
    deadline { Time.zone.today }
    status { "未着手" }
    priority { 0 }
    user { User.first || association(:user) }
  end

  factory :taskB, class: Task do
    title { 'testtesttestB' }
    content { 'samplesampleB' }
    deadline { Time.zone.today + 1 }
    status { "着手中" }
    priority { 1 }
    user { User.first }
  end

  factory :taskC, class: Task do
    title { 'testtesttestC' }
    content { 'samplesampleC' }
    deadline { Time.zone.today + 2  }
    status { "完了" }
    priority { 2 }
    user { User.first }
  end

  factory :second_task, class: Task do
    title { 'testtesttest2' }
    content { 'samplesample2' }
    deadline { Time.zone.today + 1 }
    status { "完了" }
    priority { 1 }
    user { User.find_by(id: User.first.id + 1) || association(:second_user) }
  end

  factory :third_task, class: Task do
    title { 'testtesttest3' }
    content { 'samplesample3' }
    deadline { Time.zone.today + 2 }
    status { "未着手" }
    priority { 2 }
    user { User.find_by(id: User.first.id + 2) || association(:third_user) }
  end

  factory :fourth_task, class: Task do
    title { 'testtesttest4' }
    content { 'samplesample4' }
    deadline { Time.zone.today + 3 }
    status { "未着手" }
    priority { 0 }
    user { User.find_by(id: User.first.id + 3) || association(:fourth_user) }
  end

  factory :fifth_task, class: Task do
    title { 'testtesttest5' }
    content { 'samplesample5' }
    deadline { Time.zone.today + 4 }
    status { "未着手" }
    priority { 1 }
    user { User.find_by(id: User.first.id + 4) || association(:fifth_user) }
  end
end
