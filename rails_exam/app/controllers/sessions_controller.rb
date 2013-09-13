class SessionsController < ApplicationController

  def create
    user = User.where(:name => params[:signin][:name]).first
<<<<<<< HEAD
    if user && user.authenticate(params[:signin][:password])
      session[:user_id] = user.id
      flash[:notice] = "Signed in successfully."
      redirect_to root_url
=======
    if !current_user
      session[:user_id] = user.id
      flash[:notice] = "Signed in successfully."
      redirect_to cars_path
>>>>>>> add-authentication-in-project
    else
      flash[:error] = "You can't Sign in"
      render :new
    end 
  end
<<<<<<< HEAD
=======

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out successfully."
    redirect_to root_url
  end

>>>>>>> add-authentication-in-project
end
