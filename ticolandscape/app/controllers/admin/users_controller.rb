class Admin::UsersController < ApplicationController
  layout "users"
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = params[:user]
    @user.save

  end

  def edit
  end

  def update
  end

  def delete
  end
end
