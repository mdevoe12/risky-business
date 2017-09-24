FactoryGirl.define do
  factory :worker do
    sequence :first_name {|n| "first name #{n}"}
    sequence :last_name {|n| "last name #{n}"}
  end
end
