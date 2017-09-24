FactoryGirl.define do
  factory :task do
    description "MyText"
    worker 
    supervisor nil
    points 1
  end
end
