class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logout

  private
  def current_user
    @current_user ||= User.find_by(:uid => session[:uid]) if session[:uid]
  end

  def logout
    #self.current_user = nil
    #cookies.delete("")
    session[:uid] = nil
  end

end

