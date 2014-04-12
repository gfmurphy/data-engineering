# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    description { Faker::Product.name }
    price { rand(1..100.0).round(2) }
  end
end
