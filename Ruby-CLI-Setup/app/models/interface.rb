class Interface
    
    attr_reader :prompt
    attr_accessor :user


    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
        play_music
        sleep(1.5)
        Logo.go
        puts "Welcome to MixR!".colorize(:magenta)
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
        system 'clear'
        puts "Have a good day!"
        sleep(1)
        logo
        stop_music
        sleep(1)
    end

    def log_in_helper
        name = prompt.ask("Enter Username")
        pass = prompt.ask("Enter Password")
        if User.find_by(name: name, pass: pass)
            self.user = User.find_by(name: name, pass: pass)
            puts "Welcome Back #{self.user.name}!!"
            stop_music
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
        stop_music
        mood_screen_new
    end

    def mood_screen
        prompt.select("How are you feeling today?") do |menu|
            menu.choice "Happy".colorize(:yellow), -> {change_user_mood(1)}
            menu.choice "Sad".colorize(:light_blue), -> {sad_helper}
            menu.choice "Tense".colorize(:green), -> {change_user_mood(3)}
            menu.choice "Frisky".colorize(:red), -> {change_user_mood(4)}
            menu.choice "Excited".colorize(:magenta), -> {change_user_mood(5)}
        end
    end

    def mood_screen_new
        prompt.select("How are you feeling today?") do |menu|
            menu.choice "Happy".colorize(:yellow), -> {set_user_mood(1)}
            menu.choice "Sad".colorize(:light_blue), -> {sad_helper_new}
            menu.choice "Tense".colorize(:green), -> {set_user_mood(3)}
            menu.choice "Frisky".colorize(:red), -> {set_user_mood(4)}
            menu.choice "Excited".colorize(:magenta), -> {set_user_mood(5)}
        end
    end
    
    def change_user_mood(mood)
        self.user.user_moods.update(mood_id: mood)
        main_menu
    end

    def set_user_mood(mood)
        UserMood.create(user_id: self.user.id, mood_id: mood)
        main_menu
    end

    def sad_helper
        puts "Hey, its okay to be sad =( but you really should not drink!!".colorize(:red)
        sleep(1.5)
        puts "Maybe go out with friends, take a walk and clear your head.".colorize(:yellow)
        sleep(1.5)
        puts "Come back when all is right =)".colorize(:green)
        sleep(1.5)
        prompt.select("Choose from options") do |menu|
            menu.choice "Select a new mood", -> {mood_screen}
            menu.choice "Log Off", -> {log_off}
        end
    end

    def sad_helper_new
        puts "Hey, its okay to be sad =( but you really should not drink!!".colorize(:red)
        sleep(1.5)
        puts "Maybe go out with friends, take a walk and clear your head.".colorize(:yellow)
        sleep(1.5)
        puts "Come back when all is right =)".colorize(:green)
        sleep(1.5)
        prompt.select("Choose from options") do |menu|
            menu.choice "Select a new mood", -> {mood_screen_new}
            menu.choice "Log Off", -> {log_off}
        end
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
        puts "See ya later, Alligator!".colorize(:green)
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
        system 'clear'
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
        system 'clear'
        recipe = Recipe.where(mood_id: self.user.user_moods.first.mood_id)
        chosen_recipe = prompt.select( "Which recipe do you want to see", recipe)
        puts chosen_recipe.name
        puts ""
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
                                       （ ^_^）o自自o（^_^ ）                             ".colorize(:cyan)

    end

    def play_music
        pid = fork{exec 'afplay', "Jump King - End Title Music.mp3"}
    end

    def stop_music
        pid = fork{system 'killall', 'afplay'}
    end



end
