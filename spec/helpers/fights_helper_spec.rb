require "rails_helper"

RSpec.describe FightsHelper, :type => :helper do

  describe "#opponent" do

    let(:fighter_1) { create :fighter }
    let(:fighter_2) { create :fighter }
    let(:fight) { create :fight, fighters: [fighter_1, fighter_2] }

    it "return the correct win rate" do
      assign(:title, "This Widget")

      expect(helper.opponent(fight, fighter_1)).to eq(fighter_2)
    end
  end
end
