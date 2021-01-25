class UserMood < ActiveRecord::Base

  belong_to :user
  belong_to :mood
end
