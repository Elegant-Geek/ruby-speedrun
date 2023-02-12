# --------------------------------display options for name and health: -------------------------------------
# puts "\n#{name1}'s initial health is #{health1}."
# puts "#{name2.upcase} has a health of #{health2}."
# puts "#{name3} has a health of #{health3}.".center(50, '*')
# puts "#{name4.ljust(30, '.')} #{health4} health"
# puts "Players:\n#{name1}\n#{name2}\n#{name3}\n#{name4}"

# store current time then format it all in one line under a new variable! 
def format_time
    current_time = Time.now
    formatted_time = current_time.strftime("%A %-m/%d/%Y at %-I:%M%p")
    # puts "The game started on #{formatted_time}"
end
# an example of using the last returned value from one function (format time) as input to another function
def call_game
    puts "The game has started on #{format_time}"
end
call_game


class Player
# allows you to READ and WRITE TO (change) the object values of name and health from the outside / top level.
# NOTE: these variables are grabbed directly from the names of the instance variables
    attr_accessor :name, :health

    def initialize(name, health=100)
        @name = name.capitalize
        @health = health
        puts "New player #{@name} with health of #{@health} created."
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
# creating new players
player1 = Player.new("larry", 60)
player2 = Player.new("curly", 125)
# moe takes default health value
player3 = Player.new("moe")
player4 = Player.new("shemp", 90)

#test code to run
puts player4
player4.woot
player4.blam
puts player4
# testing that you can read an objects internal state from the outside now:
puts player4.name
puts player4.health
# new name gets capitalized from the "name" method defined inside the Player class to overwrite default "name=" method
player4.name = "sheeeemp"
puts player4.name

