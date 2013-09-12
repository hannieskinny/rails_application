class CarsController < ApplicationController
  def index
    @car = Car.all
  end
  
  def new
    @car = Car.new
    3.times { @car.assets.build }
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      Notifier.user_created(@user).deliver
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
    if @car.update(car_params)
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
    params.require(:car).permit(:brand, :year, :tag_names, assets_attributes: [:asset])
  end
end
