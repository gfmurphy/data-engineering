require 'spec_helper'

describe Purchase do
  describe "associations" do
    it { should belong_to(:purchaser) }
    it { should belong_to(:item) }
    it { should belong_to(:merchant) }
    it { should belong_to(:purchase_file) }
  end
end
