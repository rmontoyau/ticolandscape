class ToolsController < ApplicationController
  def index
  end

  def new
    @tool = Tool.new({:profile_id => params[:id]})
    render :layout => false
  end

  def create
    tool = Tool.new(params[:tool])
    if tool.save!
      @user = tool.profile.user
      redirect_to @user
   else
    flass[:error] = "error"
   end  
  end

  def edit
    @tool = Tool.find(params[:id])
    render :layout => false
  end

  def update
    tool = Tool.find(params[:id])
    tool.update_attributes(params[:tool])
    @user = tool.profile.user
    redirect_to @user
  end

  def delete
    tool = Tool.find(params[:format])
    @user = tool.profile.user
    tool.destroy
    redirect_to @user
  end
end
