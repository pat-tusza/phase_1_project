class Interface
    
    attr_reader :prompt
    attr_accessor :user


    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
        puts "Welcome to Mixr!"
        sleep(0.5)
        log_in
    end
    
    def log_in
        # binding.pry
        prompt.select("What would you like to do?") do |menu|
            menu.choice "Log in", -> {log_in_helper}
            menu.choice "Sign up", -> {sign_up_helper}
            menu.choice "Exit", -> {exit_helper}
        end
    end   
    
    def exit_helper
        puts "Have a good day!"
        sleep(1)
    end

    def log_in_helper
        name = prompt.ask("Enter Username")
        pass = prompt.ask("Enter Password")
        if User.find_by(name: name, pass: pass)
            puts "Welcome Back!!"
            self.user = User.find_by(name: name, pass: pass)
            mood_screen
        else
            puts "Incorrect Username or Password 🤭"
            sleep(1)
            log_in
        end
    end

    def sign_up_helper
        name = prompt.ask("Enter Username")
        while User.find_by(name: name)
            puts "This username is already taken."
            name = prompt.ask("Enter Username")
        end
        pass = prompt.ask("Enter Password")
        self.user = User.create(name: name, pass: pass)
        # home_screen
    end

    def mood_screen
        binding.pry
        prompt.select("How are you feeling today?") do |menu|
            # binding.pry
            menu.choice "Happy", -> {self.change_user_mood(1)}
            menu.choice "Sad", -> {self.change_user_mood(2)}
            menu.choice "Tense", -> {self.change_user_mood(3)}
            menu.choice "Frisky", -> {self.change_user_mood(4)}
            menu.choice "Excited", -> {self.change_user_mood(5)}
        end
    end
    
    
    # def connect_user(name, pass)
    #     hug = User.find_by(name: name , pass: pass)
    #     if hug = self.user


    # # end
    # def create_user_mood(mood)
    #     hug = User.find_by(name: name , pass: pass)
    #     if hug = self.user
    #         UserMood.create(user_id: self.id, mood_id: mood)
    #     end
    # end
    

    # def create_user_mood(mood)
    #     hug = User.find_by(name: name , pass: pass)
    #         if hug = self.user
    #         UserMood.create(user_id: self.id, mood_id: mood)
    #         end
    #     end
    # end
    
    # def update_user_mood(int)
    #     self.user_moods.first.update(mood_id: int)
    #     self.reload
    # end

    # def home_screen
    # end

    # def main_menu
    # end


end

