require_relative 'treasure_trove'
class Player
    # allows you to READ and WRITE TO (change) the object values of name and health from the outside / top level.
    # NOTE: these variables are grabbed directly from the names of the instance variables
        attr_accessor :name, :health
        def initialize(name, health=100)
            @name = name.capitalize
            @health = health
            # puts "New player #{@name} with health of #{@health} created."
            #create a new hash for every player (every player has their own hash for treasure accumulation)
            @found_treasures = Hash.new(0)
        end

        def self.from_csv(string)
            # assign name to left csv column and health to right csv column
            name, health = string.split(',')
            # safely convert the health value from a string to an integer.
            player = Player.new(name, Integer(health))
          end

        def strong?
            @health > 100
        end

        def found_treasure(treasure)
            # accumulate points based on the treasure's name in the hash (@found_treasures[treasure.name] fetches the points associated with that treasures name)
            @found_treasures[treasure.name] += treasure.points
            puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
            puts "#{@name}'s treasures: #{@found_treasures}"
        end

        def points
            @found_treasures.values.reduce(0, :+)
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
            @health + points
        end
    
        def to_s
            # "I'm #{@name} with a health of #{@health} and a score of #{score}."
            "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
        end

        def each_found_treasure
            @found_treasures.each do |name, points|
                yield Treasure.new(name, points)
            end
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