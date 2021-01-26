class Interface

    attr_reader :prompt

    def intialize
        @prompt = TTY::prompt.new
    end

    def welcome
        puts "Welcome to Mixr!"
    end

    def log_in
        prompt.select ("What would you like to do?") do |menu|
            menu.choice "Log in" -> {log_in_helper}
            menu.choice "Sign up" -> {sign_up_helper}
            menu.choice "Exit" -> {exit_helper}
        end
    end
    

    def exit_helper
        puts "Have a good day!"
    end

    def sign_up_helper
        name =prompt.ask ("Enter Username")
        while User.find_by(name: name)
            puts "This username is already taken."
            name =prompt.ask ("Enter Username")
        end

        pass =prompt.ask ("Enter Password")
        self.user = User.create (name: name, pass: pass)
    end
end


