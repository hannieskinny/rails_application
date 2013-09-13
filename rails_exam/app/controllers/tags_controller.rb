class TagsController < ApplicationController
  def remove
    @car = Car.find(params[:car_id])
    @tag = Tag.find(params[:id])
    @car.tags -= [@tag]
    @car.save
    #render :nothing => true
  end
end

