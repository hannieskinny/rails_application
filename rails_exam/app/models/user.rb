class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :omniauthable, :omniauth_providers => [:twitter]
  has_many :cars
  before_save :ensure_authentication_token

  def self.find_for_twitter_oauth(auth)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.info.name, provider:auth.provider, uid:auth.uid, email:"#{auth.info.nickname}@example.com", password:Devise.friendly_token[0,20])
      user.save!
    end
    user
  end

end
