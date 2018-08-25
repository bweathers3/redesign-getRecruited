class UsersController < ApplicationController
  def index
    @users = User.all
    #@users = @users.sort_by(&:secondName)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.firstName = params[:user][:firstName]
    @user.secondName = params[:user][:secondName]
    @user.email = params[:user][:email]

    if @user.save
      flash[:notice] = "A new user was saved successfully."
      redirect_to @user
    else
      flash.now[:alert] = "There was an error saving the user. Please try again."
      render :new
    end
  end

  def edit
  end
end
