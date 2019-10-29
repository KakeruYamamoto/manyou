FactoryBot.define do
  factory :label do
    name { "Rails" }
  end
  factory :label2, class: Label do
    name { "Ruby" }
  end
  factory :label3, class: Label do
    name { "HTML" }
  end
  factory :label4, class: Label do
    name { "CSS" }
  end
  factory :label5, class: Label do
    name { "javascript" }
  end
end
