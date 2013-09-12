class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :find_states
  protect_from_forgery with: :exception

  def find_states
    @states = State.all
  end

  def require_signin!
   if current_user
     session[:intended_destination] = request.fullpath
     flash[:alert] = "You need to sign in or sign up before continuing."
     redirect_to signin_url
   end
  end
  
  def current_user
     User.find_by_id!(session[:user_id]) if session[:user_id] != nil
  end
end
