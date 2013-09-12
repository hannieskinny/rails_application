class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :find_states
  protect_from_forgery with: :exception

  def find_states
    @states = State.all
  end
  
  def require_signin!
   if current_user == nil
     session[:intended_destination] = request.fullpath
     flash[:alert] = "You need to sign in or sign up before continuing."
     redirect_to signin_url
   end
  end
end
