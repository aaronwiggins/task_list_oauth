class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # private def logged_in?
  #   unless session[:uid]
  #     redirect_to session_login_path, notice: "You can't access that page."
  #   end
  #
  # if User.find_by_id(session[:uid]) == nil
  #   redirect_to session_login_path
  # elsif !User.find_by_id(session[:uid])
  #   redirect_to session_login_path, notice: "You can't access that page."
  # end
# end
end
