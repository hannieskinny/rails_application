class CarsController < ApplicationController
  def index
    @car = Car.all
  end
  
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "Car has been created"
      redirect_to @car
    else
    end
  end
 
  def show
    @car = Car.find(params[:id])
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to car_path
    else
      render 'edit'
    end
  end

private
  def car_params
    params.require(:car).permit(:brand, :year)
  end
end
