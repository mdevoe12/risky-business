FactoryGirl.define do
  factory :task do
    description "MyText"
    worker 
    supervisor
    points 1

    trait :with_responses do
      after(:create) do |task|
        4.times do |time|
          task.responses << create(:response, question_num: (time + 1))
        end
      end
    end
  end
end
