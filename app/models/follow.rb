class Follow < ActiveRecord::Base
  attr_accessible :user, :follows
  
  belongs_to :user
  belongs_to :follows, class_name: 'User'
  
end
