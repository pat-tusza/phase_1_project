class Mood < ActiveRecord::Base

  has_many :user_moods
  has_many :users, through: :user_moods
  has_many :recipes
  
end
# User.second.user_moods.first.update(mood_id:2)
