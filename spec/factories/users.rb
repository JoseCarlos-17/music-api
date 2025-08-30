FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "MyString#{n}" }
    sequence(:email) { |n| "MyString#{n}" }
    password { "123123123" }
    password_confirmation { "123123123" }
  end
end
  