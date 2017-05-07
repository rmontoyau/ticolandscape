class ProfilesController < ApplicationController
  def index
  end

  def new
  end

  def create
    
  end

  def edit
  end

  def update
    profile = Profile.find(params[:id])
    profile.update_attributes(params[:profile])
    @user = profile.user
    redirect_to @user
  end

  def selete
  end
end
