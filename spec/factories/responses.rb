FactoryGirl.define do
  factory :response do
    sequence :body { |n| "response body #{n}" }
    flra
    question
  end
end
