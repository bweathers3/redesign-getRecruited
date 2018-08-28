require 'rails_helper'

RSpec.describe AthletesController, type: :controller do

  let(:my_athlete) { Athlete.create!(firstName:   Faker::Name.first_name,
    secondName:  Faker::Name.unique.last_name) }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_athlete] to @athletes" do
      get :index
      expect(assigns(:athletes)).to eq([my_athlete])
    end
  end


end
