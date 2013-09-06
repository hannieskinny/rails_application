class Car < ActiveRecord::Base
  validates :brand, :presence => true
  belongs_to :user
end
