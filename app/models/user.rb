class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :profile_bg, :profile_fg, :profile_image, :username
  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username
  validates :password_digest, :presence => true, :on => :create
  validates :username, :format => {:with => /^[a-z]\w*$/i, :message => "First Character Must be a Letter"}
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\Z/i
end
