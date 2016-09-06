require "spec_helper"

RSpec.describe Hand do
  let(:deal1) { Hand.new }

  describe ".new" do
    it "should return a Hand object" do
      expect(deal1.class).to eq(Hand)
    end

    it "should return an empty array" do
      expect(deal1.hand.class).to eq(Array)
      expect(deal1.hand.empty?).to eq(true)
      expect(deal1.hand.size).to eq(0)
    end
  end
end
