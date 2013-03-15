class Shout < ActiveRecord::Base
  attr_accessible :content, :user_id
  validates_length_of :content, minimum: 2, maximum: 140
  belongs_to :user
end
