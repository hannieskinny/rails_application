class Comment < ActiveRecord::Base
  after_create :set_car_state
  before_create :set_previous_state

  belongs_to :previous_state, :class_name => "State"
  validates :text, :presence => true
  belongs_to :car
  belongs_to :state
private
 
  def set_previous_state
    self.previous_state = car.state
  end

  def set_car_state
    self.car.state = self.state
    self.car.save!
  end
end
