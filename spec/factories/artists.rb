FactoryBot.define do
  factory :artist do
    sequence(:name) { |n| "MyString#{n}" }
    country { "MyString" }
  end
end
