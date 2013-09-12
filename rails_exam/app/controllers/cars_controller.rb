class CarsController < ApplicationController
  before_action :authorize_admin!, except: [:index, :show]
  #before_action :set_car, only: [:show, :edit, :update, :destroy]
  def index
    @car = Car.all
  end
  
  def new
    @car = Car.new
    3.times { @car.assets.build }
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      Notifier.user_created(@car.user).deliver
      flash[:notice] = "Car has been created"
      redirect_to @car
    else
    end
  end
 
  def show
    @car = Car.find(params[:id])
    @comment = @car.comments.build
    @cars = Car.all
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.user = user
    if @car.update_attributes(car_params)
      redirect_to car_path
    else
      render 'edit'
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end

  def search
    @cars = Car.search(params[:search])
  end

private
  def car_params
    params.require(:car).permit(:brand, :year, :tag_names, :user_id, assets_attributes: [:asset])
  end

  def authorize_admin!
    require_signin!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
    end 
  end

end
