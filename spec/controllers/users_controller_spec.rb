require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:this_user) { User.create!(firstName:   Faker::Name.first_name,
    secondName:  Faker::Name.unique.last_name,
    email:       Faker::Internet.unique.email) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [this_user] to @users" do
       get :index
       expect(assigns(:users)).to eq([this_user])
     end
  end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
