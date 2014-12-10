FactoryGirl.define do
  factory :concept do
    sequence(:title) { |n| "Concept #{n}" }
  end
end
