require 'spec_helper'

describe PurchaseFile do
  subject(:purchase_file) { PurchaseFile.new }

  describe "associations" do
    it { should have_many(:purchases).dependent(:destroy) }
  end

  describe "validation" do
    it { should validate_presence_of(:filename) }
  end

  describe "attaching data file" do
    let(:filename) { "example_input.tab" }
    let(:filepath) { File.join(Rails.root, "spec", "fixtures", filename) }

    it "sets the filename on the purchase file" do
      File.open(filepath) do |f|
        purchase_file.data_file = f
        expect(purchase_file).to be_valid
        expect(purchase_file.filename).to eq(filename)
      end
    end
  end
end
