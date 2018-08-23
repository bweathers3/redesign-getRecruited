require 'rails_helper'

RSpec.describe Sport, type: :model do
  let(:user) { User.create!(firstName: "Bill", secondName: "Smith", email: "bill.smith@gmail.com") }
  let(:athlete) { Athlete.create!(firstName: 'Sally', secondName: "Smith", active: true, user: user) }
  let(:sport) { Sport.create!(sportName: 'Womens Swimming', athlete: athlete) }

  describe "Sport attributes" do
    it "has the sportName attribute" do
      expect(sport).to have_attributes(sportName: 'Womens Swimming')
    end
  end
end
