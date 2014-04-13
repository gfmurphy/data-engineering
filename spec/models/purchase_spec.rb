require 'spec_helper'

describe Purchase do
  subject(:purchase) { FactoryGirl.build(:purchase) }

  describe "associations" do
    it { should belong_to(:purchaser) }
    it { should belong_to(:item) }
    it { should belong_to(:merchant) }
    it { should belong_to(:purchase_file) }
  end

  describe "#total" do
    it "equals the item price times the item count" do
      expect(purchase.total).to eq(purchase.item_count * purchase.item_price)
    end
  end

  describe "#item_price" do
    it "gives the price of the purchaed item" do
      expect(purchase.item_price).to eq(purchase.item.price)
    end
  end
end
