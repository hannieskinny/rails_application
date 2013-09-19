class Api::V1::CarsController < Api::V1::BaseController
  before_filter :find_car, :only => [:show, :update, :destroy]
  
  def index
    #respond_with(current_user.cars)
    respond_with(Car.all)
  end

  def create
    car = car.new(params[:car])
    if car.save
      respond_with(car, :location => api_v1_car_path(car))
    else
      respond_with(car)
    end
  end

  def show
    car = Car.find(params[:id])
    respond_with(car, :methods => "last_ticket")
  end

  def update
    @car.update_attributes(params[:car])
    respond_with(@car)
  end

  def destroy
    @car.destroy
    respond_with(@car)
  end

  private
    def find_car
      @car = Car.for(current_user).find(params[:id])
      rescue ActiveRecord::RecordNotFound
      error = { :error => "The car you were looking for " +
                          "could not be found."}
      respond_with(error, :status => 404)
    end
end
