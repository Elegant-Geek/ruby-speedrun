module StudioGame    
    module Playable
        def woot()
            @health += 15
            puts "Player #{@name} got wooted!"
        end
        
        def blam()
            @health -= 10
            puts "Player #{@name} got blammed!"
        end
        
        def strong?
            @health > 100
        end
    end
end