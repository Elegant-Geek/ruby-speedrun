class Player
    # allows you to READ and WRITE TO (change) the object values of name and health from the outside / top level.
    # NOTE: these variables are grabbed directly from the names of the instance variables
        attr_accessor :name, :health
        def initialize(name, health=100)
            @name = name.capitalize
            @health = health
            # puts "New player #{@name} with health of #{@health} created."
        end

        def strong?
            @health > 100
        end

    # if you rename a player without the name capitalized, it will not auto-update unless this method is specified inside this class.
        def name=(new_name)
            @name = new_name.capitalize
          end
    
        def woot()
            @health += 15
            puts "Player #{@name} got wooted!"
        end
        
        def blam()
            @health -= 10
            puts "Player #{@name} got blammed!"
        end
    
        def score 
            @health + @name.length
        end
    
        def to_s
            "I'm #{@name} with a health of #{@health} and a score of #{score}."
        end
end

# dummy sample code to test (only will run if you run this current file)
if __FILE__ == $0
    player = Player.new("moe")
    puts player.name
    puts player.health
    player.woot
    puts player.health
    player.blam
    puts player.health
end