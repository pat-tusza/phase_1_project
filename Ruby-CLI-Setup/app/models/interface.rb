class Interface
    
    attr_reader :prompt
    attr_accessor :user


    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
        Logo.go
        puts "Welcome to MixR!"
        sleep(0.5)
        log_in
    end
    
    def log_in
        prompt.select("What would you like to do?") do |menu|
            menu.choice "Log in", -> {log_in_helper}
            menu.choice "Sign up", -> {sign_up_helper}
            menu.choice "Exit", -> {exit_helper}
        end
    end   
    
    def exit_helper
        puts "Have a good day!"
        sleep(1)
        logo
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
            puts "Incorrect Username or Password ¯\_(ツ)_/¯"
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
        prompt.select("How are you feeling today?") do |menu|
            menu.choice "Happy", -> {change_user_mood(1)}
            menu.choice "Sad", -> {change_user_mood(2)}
            menu.choice "Tense", -> {change_user_mood(3)}
            menu.choice "Frisky", -> {change_user_mood(4)}
            menu.choice "Excited", -> {change_user_mood(5)}
        end
    end

    def mood_screen_new
        prompt.select("How are you feeling today?") do |menu|
            menu.choice "Happy", -> {set_user_mood(1)}
            menu.choice "Sad", -> {set_user_mood(2)}
            menu.choice "Tense", -> {set_user_mood(3)}
            menu.choice "Frisky", -> {set_user_mood(4)}
            menu.choice "Excited", -> {set_user_mood(5)}
        end
    end
    
    def change_user_mood(mood)
        self.user.user_moods.first.update(mood_id: mood)
        main_menu
    end

    def set_user_mood(mood)
        UserMood.create(user_id: self.user.id, mood_id: mood)
        main_menu
    end
  
    def main_menu
        system 'clear'
        prompt.select("Main Menu") do |menu|
            menu.choice "See all recipes", -> {see_recipes}
            menu.choice "Surprise me", -> {random_recipe}
            menu.choice "Change Mood", -> {mood_screen}
            menu.choice "Delete Account", -> {delete_account}
            menu.choice "Log Off", -> {log_off}
        end
    end

    def log_off
        puts "See ya later, Alligator!"
        sleep(1)
        welcome
    end

    def delete_account
        current_user = User.find(self.user.id)
        current_user.delete
        puts "Your account has successfully been deleted. ʕ •`ᴥ•´ʔ"
        sleep(2)
        welcome
    end

    def random_recipe
        sleep(1)
        random = Recipe.where(mood_id: self.user.user_moods.first.mood_id)
        new_random = random.sample 
        puts new_random.name
        puts ""
        puts new_random.ingredients.map(&:name)
        prompt.select ("Select from options") do |menu|
            menu.choice "Show me another recipe", -> {random_recipe}
            menu.choice "Bring me back to the main menu", -> {main_menu}
        end
    end
    
    def see_recipes
        recipe = Recipe.where(mood_id: self.user.user_moods.first.mood_id)
        chosen_recipe = prompt.select( "Which recipe do you want to see", recipe)
        puts chosen_recipe.name
        puts chosen_recipe.ingredients.map(&:name)
        prompt.select(" Select from options") do |menu|
            menu.choice "Show me another recipe", -> {see_recipes}
            menu.choice "Go back to main menu", -> {main_menu}
        end
    end


    def logo
        puts "
        MMMMMMMM               MMMMMMMM  iiii                      RRRRRRRRRRRRRRRRR   
        M:::::::M             M:::::::M i::::i                     R::::::::::::::::R  
        M::::::::M           M::::::::M  iiii                      R::::::RRRRRR:::::R 
        M:::::::::M         M:::::::::M                            RR:::::R     R:::::R
        M::::::::::M       M::::::::::Miiiiiii xxxxxxx      xxxxxxx  R::::R     R:::::R
        M:::::::::::M     M:::::::::::Mi:::::i  x:::::x    x:::::x   R::::R     R:::::R
        M:::::::M::::M   M::::M:::::::M i::::i   x:::::x  x:::::x    R::::RRRRRR:::::R 
        M::::::M M::::M M::::M M::::::M i::::i    x:::::xx:::::x     R:::::::::::::RR  
        M::::::M  M::::M::::M  M::::::M i::::i     x::::::::::x      R::::RRRRRR:::::R 
        M::::::M   M:::::::M   M::::::M i::::i      x::::::::x       R::::R     R:::::R
        M::::::M    M:::::M    M::::::M i::::i      x::::::::x       R::::R     R:::::R
        M::::::M     MMMMM     M::::::M i::::i     x::::::::::x      R::::R     R:::::R
        M::::::M               M::::::Mi::::::i   x:::::xx:::::x   RR:::::R     R:::::R
        M::::::M               M::::::Mi::::::i  x:::::x  x:::::x  R::::::R     R:::::R
        M::::::M               M::::::Mi::::::i x:::::x    x:::::x R::::::R     R:::::R
        MMMMMMMM               MMMMMMMMiiiiiiiixxxxxxx      xxxxxxxRRRRRRRR     RRRRRRR".colorize(:magenta)
        puts"                                  
                                       （ ^_^）o自自o（^_^ ）                             ".colorize(:green)
        # sleep(3)
        # welcome

    end

end
#:blue
#:magenta