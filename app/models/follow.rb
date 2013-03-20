class Follow < ActiveRecord::Base
  attr_accessible :user_id, :follow_id
  
  belongs_to :user
  belongs_to :follows, class_name: 'User'
  
end
