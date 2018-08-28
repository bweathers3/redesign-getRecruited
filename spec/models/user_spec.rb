require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(firstName: "Bill", secondName: "Smith", email: "bill.smith@gmail.com") }

  it { is_expected.to have_many(:athletes) }

  describe "User attributes" do
    it "has firstName, secondName and email attributes" do
      expect(user).to have_attributes(firstName: "Bill", secondName: "Smith", email: "bill.smith@gmail.com")
    end
  end
end
