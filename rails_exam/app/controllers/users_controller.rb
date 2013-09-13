class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "User saved correctly"
      redirect_to @user
    else
      render :new
    end
  end

private
  def user_params
<<<<<<< HEAD
    params.require(:user).permit(:name, :password, :password_confirmation)
=======
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
>>>>>>> add-authentication-in-project
  end

end
