FactoryBot.define do

  factory :task do
    title { 'testtesttest' }
    content { 'samplesample' }
    deadline { Time.zone.today }
  end

  factory :second_task, class: Task do
    title { 'testtesttest2' }
    content { 'samplesample2' }
    deadline { Time.zone.today + 1 }
  end

  factory :third_task, class: Task do
    title { 'testtesttest3' }
    content { 'samplesample3' }
    deadline { Time.zone.today + 2 }
  end
end
