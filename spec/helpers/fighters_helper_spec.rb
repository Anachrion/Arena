require "rails_helper"

RSpec.describe FightersHelper, :type => :helper do
  describe "#victory_rate" do

    let(:fight) { create :fight }

    it "return the correct win rate" do
      assign(:title, "This Widget")

      expect(helper.victory_rate(fight.winner)).to eq(100)
      expect(helper.victory_rate(fight.fighters.select{|f| f.id != fight.winner_id}.first)).to eq(0)
    end
  end
end
