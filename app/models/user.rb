class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :profile_bg, :profile_fg, :profile_image, :username
  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username
end
