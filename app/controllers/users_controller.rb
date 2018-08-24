class UsersController < ApplicationController
  def index
    @users = User.all
    @users = @users.sort_by(&:secondName)
  end

  def show
  end

  def new
  end

  def edit
  end
end
