FactoryGirl.define do
  factory :purchase do
    purchaser
    item
    merchant
    purchase_file
    item_count { rand(1..10) }
  end
end
