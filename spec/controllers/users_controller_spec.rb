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
       expect(assigns(:users)).to include(this_user)
     end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @user" do
      get :new
      expect(assigns(:user)).not_to be_nil
    end
  end

  describe "User create" do
    let(:this_user2) { User.create!(firstName:   Faker::Name.first_name,
      secondName:  Faker::Name.unique.last_name,
      email:       Faker::Internet.unique.email) }

    it "increases the number of User by 1" do
      expect { this_user2 }.to change { User.count }.by(1)
    end

    it "assigns the new user to @user" do
      expect(assigns(:this_user2)).to eq User.last
    end

    # it "redirects to the new user" do
    #   expect(response).to redirect_to User.last
    # end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, params: {id: this_user.id}
      expect(response).to have_http_status(:success)
    end

   it "renders the #show view" do
     get :show, params: {id: this_user.id}
     expect(response).to render_template :show
   end

   it "assigns my_post to @post" do
     get :show, params: {id: this_user.id}
     expect(assigns(:user)).to eq(this_user)
   end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: this_user.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
        get :new
        expect(response).to render_template :new
    end

  end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
