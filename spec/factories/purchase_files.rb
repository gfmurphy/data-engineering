FactoryGirl.define do
  sequence :filename do |n|
    "foo-#{n}.txt"
  end

  factory :purchase_file do
    filename { generate(:filename) }
  end
end
