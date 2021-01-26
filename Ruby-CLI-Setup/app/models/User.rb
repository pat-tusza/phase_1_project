class User < ActiveRecord::Base

    has_many :user_moods
    has_many :moods, through: :user_moods

    def create_user_mood(mood)
        UserMood.create(user_id: self.id, mood_id: mood)
    end
    
    def $change_user_mood(int)
        self.user_moods.first.update(mood_id: int)
        self.reload
    end
end
