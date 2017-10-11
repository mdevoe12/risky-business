FactoryGirl.define do
  factory :flra do
    description "MyText"
    worker
    supervisor
    points nil
    category
    sequence :worker_risk_score {|n| n}

    trait :with_responses do
      # titles = ['What are you doing?', 'What could do go wrong?', 'How could it affect you?', 'How could it go wrong?']
      after(:create) do |flra|
        5.times do |title|
          flra.responses << create(:response)
        end
      end
    end
  end
end
