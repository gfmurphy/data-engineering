require 'spec_helper'

describe PurchaseFile do
  describe "associations" do
    it { should have_many(:purchases).dependent(:destroy) }
  end

  describe "validation" do
    it { should validate_presence_of(:filename) }
  end
end
