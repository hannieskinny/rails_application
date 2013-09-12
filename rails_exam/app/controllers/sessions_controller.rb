class SessionsController < ApplicationController

  def create
    user = User.where(:name => params[:signin][:name]).first
    if current_user
      session[:user_id] = user.id
      flash[:notice] = "Signed in successfully."
      redirect_to cars_path
    else
      flash[:error] = "You can't Sign in"
      render :new
    end 
  end
end
