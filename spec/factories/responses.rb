FactoryGirl.define do
  factory :response do
    body { Faker::Hacker.say_something_smart }
    task
  end
end
