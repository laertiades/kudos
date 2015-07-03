FactoryGirl.define do  factory :merit do
    message "MyText"
meritor_id 1
meritee_id 1
  end

  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
  end
end
