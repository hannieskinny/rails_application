class Car < ActiveRecord::Base
  validates :brand, :presence => true
  mount_uploader :asset, AssetUploader
end
