class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user_session, :current_user

  private
  def current_user_session
    logger.debug "ApplicationController::current_user_session"
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    logger.debug "ApplicationController::current_user"
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    logger.debug "ApplicationController::require_user"
    unless current_user
      #store_location
      flash[:warning] = "You must be logged in to access this page"
      redirect_to :login
      return false
    end
  end
  
  def require_no_user
    logger.debug "ApplicationController::require_no_user"
    if current_user
      #store_location
      flash[:warning] = "You must be logged out to access this page"
      redirect_to '/play#index'
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end
end
