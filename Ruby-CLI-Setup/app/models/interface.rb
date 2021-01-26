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
    end

    def log_in_helper
    end

    def sign_up_helper
        name =prompt.ask("Enter Username")
        while User.find_by(name: name)
            puts "This username is already taken."
            name = prompt.ask("Enter Username")
        end
        pass = prompt.ask("Enter Password")
        self.user = User.create(name: name, pass: pass)
    end


end


