require 'spec_helper'

describe Merchant do
  describe "associations" do
    it { should have_many(:purchases).dependent(:destroy) }
  end
end
