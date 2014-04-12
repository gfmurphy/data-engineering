require 'spec_helper'

describe Item do
  describe "associations" do
    it { should have_many(:purchases).dependent(:destroy) }
  end
end
