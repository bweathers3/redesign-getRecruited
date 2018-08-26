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

  describe "GET edit" do
     it "returns http success" do
       get :edit, params: {id: this_user.id}
       expect(response).to have_http_status(:success)
     end

     it "renders the #edit view" do
       get :edit, params: {id: this_user.id}
       expect(response).to render_template :edit
     end

     it "assigns post to be updated to @post" do
       get :edit, params: {id: this_user.id}
       user_instance = assigns(:user)
       expect(user_instance.firstName).to eq this_user.firstName
       expect(user_instance.secondName).to eq this_user.secondName
       expect(user_instance.email).to eq this_user.email
     end
   end

   # describe "PUT update" do
   #
   #      it "updates post with expected attributes" do
   #        new_firstName = Faker::Name.first_name
   #        new_secondName = Faker::Name.unique.last_name
   #        new_email = Faker::Internet.unique.email
   #
   #        put :update, :params => { :id this_user3.id, :user => { firstName: new_firstName, secondName: new_secondName, email: new_email } }
   #
   #        updated_user = assigns(:user)
   #        expect(updated_user.id).to eq this_user.id
   #        expect(updated_user.firstName).to eq new_firstName
   #        expect(updated_user.secondName).to eq new_secondName
   #        expect(updated_user.email).to eq new_email
   #      end
   #
   #      # it "redirects to the updated post" do
   #      #   new_title = RandomData.random_sentence
   #      #   new_body = RandomData.random_paragraph
   #      #   put :update, id: my_post.id, post: {title: new_title, body: new_body}
   #      #   expect(response).to redirect_to my_post
   #      # end
   #    end

  describe "DELETE destroy User" do
    it "deletes the user" do
      delete :destroy, params: {id: this_user.id}
      count = User.where({id: this_user.id}).size
      expect(count).to eq 0
    end

    it "redirects to users index" do
      delete :destroy, params: {id: this_user.id}
      expect(response).to redirect_to users_path
    end
  end
end
