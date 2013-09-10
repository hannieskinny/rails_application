class Car < ActiveRecord::Base
  validates :brand, :presence => true
  mount_uploader :asset, AssetUploader
  has_many :assets
  accepts_nested_attributes_for :assets
end
