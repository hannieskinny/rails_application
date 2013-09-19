class CarsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  caches_action :index
  #caches_action :index, :cache_path => (proc do
    #cars_path("/#{current_user.id}/#{params[:page] || 1}")
  #end)
  
  def index
    @car = Car.all
    @cars = Car.page(params[:page]).per(3)

  end
  
  def new
    @car = Car.new
    3.times { @car.assets.build }
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      Notifier.send_email_to(@car.user).deliver
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
    @car = Car.search("tag:#{params['search']}")
    render "index"
  end

private
  def car_params
    params.require(:car).permit(:brand, :year, :tag_names, :user_id, assets_attributes: [:asset])
  end

end
