class CommentsController < ApplicationController
before_filter :find_car
   
  def create
    @comment = @car.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to [@car]
    else
      flash[:alert] = "Comment has not been created."
      render :template => "cars/show"
    end
  end 

  private
  def find_car
    @car = Car.find(params[:car_id])
  end
  
  def comment_params
    params.require(:comment).permit(:text, :state_id)
  end
end
