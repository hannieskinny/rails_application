class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :find_states
  protect_from_forgery with: :exception

  def find_states
    @states = State.all
  end

end
