class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  has_secure_password
  
  validates :description, presence: true, length: {minimum: 2, maximum: 140 }, on: :update
  validates :location, presence: true, length: {minimum: 2, maximum: 30 }, on: :update
  
  has_many :microposts
end
