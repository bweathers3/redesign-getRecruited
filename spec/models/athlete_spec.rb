require 'rails_helper'

RSpec.describe Athlete, type: :model do
  let(:user) { User.create!(firstName: "Bill", secondName: "Smith", email: "bill.smith@gmail.com") }
  let(:athlete) { user.athletes.create!(firstName: 'Sally', secondName: "Smith", user: user) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:sports) }

  describe "Athlete attributes" do
    it "has a firstName, secondName and active attribute" do
      expect(athlete).to have_attributes(firstName: 'Sally', secondName: "Smith", user: user)
    end

    it "is active by default" do
       expect(athlete.active).to be(true)
    end
  end
end
