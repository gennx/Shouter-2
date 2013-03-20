class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :profile_bg, :profile_fg, :profile_image, :username
  has_secure_password
  validates_presence_of :email, :username 
  validates_uniqueness_of :email, :username
  validates :password_digest, :presence => true, :on => :create
  validates :username, :format => {:with => /^[a-z]\w*$/i, :message => "First Character Must be a Letter"}
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\Z/i
  validates :username, :exclusion => { :in => %w(admin kyle leo)}
  
  mount_uploader :profile_image, ProfileImageUploader
  has_many :shouts, :dependent => :destroy
  has_many :follows
  
  
  def follows?(user)
      Follow.exists? user_id: self.id, follows_id: user.id
  end
end
