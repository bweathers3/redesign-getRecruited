require 'rails_helper'

RSpec.describe Athlete, type: :model do
  let(:user) { User.create!(firstName: "Bill", secondName: "Smith", email: "bill.smith@gmail.com") }
  let(:athlete) { Athlete.create!(firstName: 'Sally', secondName: "Smith", active: true, user: user) }

  describe "Athlete attributes" do
    it "has a firstName, secondName and active attribute" do
      expect(athlete).to have_attributes(firstName: 'Sally', secondName: "Smith", active: true, user: user)
    end
  end
end
