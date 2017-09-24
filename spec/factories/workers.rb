FactoryGirl.define do
  factory :worker do
    sequence :first_name do |n|
      "first name #{n}"
    end
    sequence :last_name do |n|
     "last name #{n}"
    end
  end
end
