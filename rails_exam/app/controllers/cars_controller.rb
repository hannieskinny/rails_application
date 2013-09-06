class CarsController < ApplicationController
  def index
  end
  
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @project.save
      flash[:notice] = "Car has been created"
      redirect_to @car
    else
    end
  end
  
private
  def car_params
    params.require(:car).permit(:brand, :year)
  end
end
