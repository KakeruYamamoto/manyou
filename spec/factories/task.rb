FactoryBot.define do

  factory :task do
    title { 'testtesttest' }
    content { 'samplesample' }
  end

  factory :second_task, class: Task do
    title { 'testtesttest2' }
    content { 'samplesample2' }
  end

  factory :third_task, class: Task do
    title { 'testtesttest3' }
    content { 'samplesample3' }
  end
end
