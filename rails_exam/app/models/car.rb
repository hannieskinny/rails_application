class Car < ActiveRecord::Base
  validates :brand, :presence => true
  has_many :assets
  accepts_nested_attributes_for :assets
  has_many :comments
  belongs_to :state
end

