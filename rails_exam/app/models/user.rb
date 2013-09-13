class User < ActiveRecord::Base
  has_secure_password
  has_many :cars
  before_save :authorize_admin!
end
