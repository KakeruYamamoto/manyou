FactoryBot.define do

  factory :task do
    title { 'testtesttest' }
    content { 'samplesample' }
    deadline { Time.zone.today }
    status { "未着手" }
    priority { 0 }
  end

  factory :second_task, class: Task do
    title { 'testtesttest2' }
    content { 'samplesample2' }
    deadline { Time.zone.today + 1 }
    status { "完了" }
    priority { 1 }
  end

  factory :third_task, class: Task do
    title { 'testtesttest3' }
    content { 'samplesample3' }
    deadline { Time.zone.today + 2 }
    status { "未着手" }
    priority { 2 }
  end

  factory :fourth_task, class: Task do
    title { 'testtesttest4' }
    content { 'samplesample4' }
    deadline { Time.zone.today + 3 }
    status { "未着手" }
    priority { 0 }
  end

  factory :fifth_task, class: Task do
    title { 'testtesttest5' }
    content { 'samplesample5' }
    deadline { Time.zone.today + 4 }
    status { "未着手" }
    priority { 1 }
  end
end
