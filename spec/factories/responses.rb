FactoryGirl.define do
  factory :response do
    sequence :body do |n|
      "response body #{n}"
    end
    flra
    question
  end
end
