class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    if session[:token]
      UserFacade.find_user(session[:email])
    else
      nil
    end
  end

  def active_session?
    if session[:token]
      return true
    else 
      return false
    end
  end

end
