class ExperiencesController < ApplicationController
  def new
  end

  def create
    experience = Experience.new(params[:experience])
    if experience.save!
      @user = experience.profile.user
      redirect_to @user
    end
  end

  def edit
  end

  def update
    @experience = Experience.find(params[:id])
    @experience.update_attributes(params[:experience])
    if @experience.save!
      @user = @experience.profile.user
      redirect_to @user
    end
  end

  def show
  end

  def delete
    @experience = Experience.find(params[:format])    
    @user = @experience.profile.user
    @experience.destroy
    redirect_to @user
  end
end
