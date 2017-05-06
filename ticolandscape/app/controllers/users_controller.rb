class UsersController < ApplicationController
  layout "users"
  def index
    @users = User.all
  end

  def new
    @user = User.new
    #@user.profile = Profile.new
    @user.build_profile
  end

  def create
    @user = User.new(params[:user])
    if @user.save!
    	redirect_to @user
   else
   	render :new
    flass[:error] = "error"
   end 	
  end

  def edit
  end

  def update
  end

  def delete
  end

  def show
  	@user = User.find(params[:id])
    @experience = Experience.new({:profile_id => @user.profile.id})
  end
end
