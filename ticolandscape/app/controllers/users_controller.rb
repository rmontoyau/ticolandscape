class UsersController < ApplicationController
  layout "users"
  def index
    @users = User.all
  end

  def new
    @user = User.new    
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
    if @user.profile.location.nil?
      @user.profile.build_location
    end
    if @user.profile.phone.nil?
      @user.profile.build_phone
    end
    @experience = Experience.new({:profile_id => @user.profile.id})
    @tool = Tool.new({:profile_id => @user.profile.id})
  end
end
