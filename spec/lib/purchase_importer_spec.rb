require "spec_helper"

describe PurchaseImporter do
  subject(:importer) { PurchaseImporter.new(purchase_file) }
  let(:purchase_file) { FactoryGirl.create(:purchase_file) }
  let(:purchaser) { { name: Faker::Name.name } }
  let(:item) { { description: Faker::Product.product, price: rand(1..100.0).round(2) } }
  let(:merchant) { { name: Faker::Company.name, address: Faker::Address.street_address } }
  let(:row) { { purchaser: purchaser, merchant: merchant, item: item, item_count: 2 } }

  describe "#import" do
    it "starts a transaction" do
      expect(Purchase).to receive(:transaction).and_call_original
      importer.import
    end

    it "yields importer instance to block" do
      expect { |b| importer.import(&b) }.to yield_with_args(importer)
    end
  end

  describe "#<<" do
    it "adds a purchase" do
      expect(importer << row).to be_a(Purchase)
    end

    it "adds the correct item" do
      item = (importer << row).item
      expect(item.description).to eq(row[:item].fetch(:description))
    end

    it "adds the correct merchant" do
      merchant = (importer << row).merchant
      expect(merchant.name).to eq(row[:merchant].fetch(:name))
    end

    it "adds the correct purchaser" do
      purchaser = (importer << row).purchaser
      expect(purchaser.name).to eq(row[:purchaser].fetch(:name))
    end

    it "adds the correct item count" do
      purchase = importer << row
      expect(purchase.item_count).to eq(row[:item_count])
    end

    it "updates the gross revenue" do
      purchase_total = (row[:item_count] * item[:price]).to_d
      expect { importer << row }.to change { purchase_file.gross_revenue }
        .by(purchase_total)
    end
  end
end
