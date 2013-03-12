class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :profile_bg, :profile_fg, :profile_image, :username
end
