class UserSessionsController < ApplicationController
  
  skip_before_filter :validate_enabled_company, :only => [:logout_user, :logout_with_cas, :logout_without_cas]

  def login_without_cas
    session[:current_role] = nil
    session[:legal_entity_id] = nil
    current_user.current_role_id = nil
    current_user.save
    @user_session = UserSession.new
    render :new
  end

  def popup
    @user_session = UserSession.new
    @valid = false
    @message = "Session has expired, please log in again"
    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @user_session }
    end
  end

  def relogin
    @user_session = UserSession.new(params[:user_session])
    @valid = false
    @message = ""
    if @user_session.save
      @user = User.where(:login => @user_session.login).first
      if @user.status == :active
        @valid = true
      else
        @message = "This user is not active"
      end
      render :action => :popup, :layout => false
    else
      render :action => :popup, :layout => false
    end
  end
  
  def create
    reset_session
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      @user = User.where(:login => @user_session.login).first
    end
    respond_to do |format|
      format.html {
        unless @user.nil?
          if @user.active?
            successful_authentication(@user_session)
          else
            account_pending
          end
        else
          render :action => :new
        end  
      }
      format.xml { render :xml => @user || {} }
      format.json { render :json => @user || {} }
    end
  end

  def logout_without_cas
    logout_user
    redirect_to root_url
  end
  
  def logout_user
    current_user_session.destroy unless current_user_session.nil?
    flash[:notice] = "Logout successful!"
  end
  
  def successful_authentication(user)
    flash[:notice] = "Welcome #{user.login} !"
    redirect_back_or_default root_url
  end
  
  def account_pending
    current_user_session.destroy unless current_user_session.nil?
    flash[:notice] = "Your account is disabled or awaiting for confirmation"
    redirect_to logout_url
  end
  
  def login_with_cas    
    if CASClient::Frameworks::Rails::Filter.filter(self)
            
      # User has been successfully authenticated with CAS
      user = User.where(:login => session[:cas_user]).first
      logout_with_cas if user.nil?
      # ...and is also active
      if user.active?
        successful_authentication(user)
      else
        account_pending
      end
    end
  end
    
  def logout_with_cas
    logout_user
    CASClient::Frameworks::Rails::Filter.logout(self, root_url)
  end
  
end
