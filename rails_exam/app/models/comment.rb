class Comment < ActiveRecord::Base
  after_create :set_car_state
  before_create :set_previous_state

  belongs_to :previous_state, :class_name => "State"
  validates :text, :presence => true
  belongs_to :car
  belongs_to :state
  after_create :associate_tags_with_car
  attr_accessor :tag_names
private
 
  def set_previous_state
    self.previous_state = car.state
  end

  def set_car_state
    self.car.state = self.state
    self.car.save!
  end

  def associate_tags_with_ticket
    if tag_names
      tags = tag_names.split(" ").map do |name|
        Tag.find_or_create_by_name(name)
      end
      self.car.tags += tags
      self.car.save
    end 
  end
end
