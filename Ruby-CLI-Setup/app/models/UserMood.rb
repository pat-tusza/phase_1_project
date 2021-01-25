class UserMood < ActiveRecord::Base

  belongs_to :user
  belongs_to :mood
end
