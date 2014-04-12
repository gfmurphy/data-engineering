require "spec_helper"

describe DataFileParser do
  let(:filename) { File.join(Rails.root, "spec", "fixtures", "example_input.tab") }
  subject(:parser) { DataFileParser.new(filename) }

  it "parses purchasers correctly" do
    expected = ["Snake Plissken", "Amy Pond", "Marty McFly", "Snake Plissken"]
    expect(parser.map { |r| r[:purchaser].fetch(:name) }).to eq(expected)
  end

  it "parses merchants correctly" do
    expected = ["123 Fake St", "Sneaker Store Emporium"]
    expect(parser.map { |r|
        [r[:merchant].fetch(:address), r[:merchant].fetch(:name)] }.last)
      .to eq(expected)
  end

  it "parses items correctly" do
    expected = ["$20 Sneakers for $5", BigDecimal.new("5.0")]
    expect(parser.map { |r|
        [r[:item].fetch(:description), r[:item].fetch(:price)] }.last)
      .to eq(expected)
  end

  it "parses item count correctly" do
    expected = %w(2 5 1 4).map(&:to_i)
    expect(parser.map { |r| r.fetch(:item_count) }).to eq(expected)
  end
end
