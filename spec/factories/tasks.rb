FactoryGirl.define do
  factory :task do
    description "MyText"
    worker 
    supervisor 
    points 1

    trait :with_responses do
      titles = ['What are you doing?', 'What could do go wrong?', 'How could it affect you?', 'How could it go wrong?']
      after(:create) do |task|
        titles.each do |title|
          task.responses << create(:response, question_title: (title))
        end
      end
    end
  end
end
