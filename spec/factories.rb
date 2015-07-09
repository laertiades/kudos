FactoryGirl.define do
  factory :organization do
    sequence(:name)  { |n| "Organization #{n}" }
  end

  factory :merit do
    message "MyText"
  end

  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
  end
end
