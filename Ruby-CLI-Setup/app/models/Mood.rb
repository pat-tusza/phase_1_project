class Mood < ActiveRecord::Base

  has_many :user_moods
  has_many :users, through: :user_moods
  has_many :recipes
  
end

