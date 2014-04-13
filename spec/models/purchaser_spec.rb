require 'spec_helper'

describe Purchaser do
  describe "associations" do
    it { should have_many(:purchases).dependent(:destroy) }
  end
end
