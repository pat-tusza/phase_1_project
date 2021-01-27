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
        mood_screen_new
    end

    def mood_screen
        # binding.pry
        prompt.select("How are you feeling today?") do |menu|
            # binding.pry
            menu.choice "Happy", -> {change_user_mood(1)}
            menu.choice "Sad", -> {change_user_mood(2)}
            menu.choice "Tense", -> {change_user_mood(3)}
            menu.choice "Frisky", -> {change_user_mood(4)}
            menu.choice "Excited", -> {change_user_mood(5)}
        end
    end

    def mood_screen_new
        # binding.pry
        prompt.select("How are you feeling today?") do |menu|
            # binding.pry
            menu.choice "Happy", -> {set_user_mood(1)}
            menu.choice "Sad", -> {set_user_mood(2)}
            menu.choice "Tense", -> {set_user_mood(3)}
            menu.choice "Frisky", -> {set_user_mood(4)}
            menu.choice "Excited", -> {set_user_mood(5)}
        end
    end
    
    def change_user_mood(mood)
        # binding.pry
        self.user.user_moods.first.update(mood_id: mood)
        main_menu
    end

    def set_user_mood(mood)
        # binding.pry
        UserMood.create(user_id: self.user.id, mood_id: mood)
        main_menu
    end
  
    def home_screen
        
    end

    def main_menu
        puts "this is a test, if you are reading this, hi tester 🥳🥳🥳🥳🥳"
        #this will have five options
        # -give me recipes -> method to retrive recipes based on mood
        # -give me a random one -> method to retrive a random recipe based on mood
        # -i wanna change my mood -> #mood_screen
        # -i wanna delete my account -> method to delete current account
        # -i wanna sign off -> method to log off 
    end


end

