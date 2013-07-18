require 'helper'

RSpec.describe RFastRFurious do

  describe ".check" do

    AWESOME_MOVIES = [
      "The Fast and the Furious",
      "2 Fast 2 Furious",
      "The Fast and the Furious: Tokyo Drift",
      "Fast & Furious",
      "Fast Five",
    ]

    AWESOME_MOVIES.each do |title|
      it "is true for \"#{title}\"" do
        expect(RFastRFurious.check(title)).to be_true
      end
    end

    UNAWESOME_MOVIES = [
      "The Sorrow and the Pity",
    ]

    UNAWESOME_MOVIES.each do |title|
      it "is false for \"#{title}\"" do
        expect(RFastRFurious.check(title)).to be_false
      end
    end

  end

end
