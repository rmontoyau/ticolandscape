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
  end

  def show
  end
end