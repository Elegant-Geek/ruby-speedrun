module StudioGame
    class Die
        # we may want our die to always have a valid 
        # number between 1 and 6 even if it hasn't been rolled yet. 
        # Think of it as the die rolling itself when it's created. 
        # To do that, write an initialize method that calls roll, which sets @number.
        attr_reader :number
        def initialize 
            roll
        end
        def roll
            @number = rand(1..6)
        end
    end
end