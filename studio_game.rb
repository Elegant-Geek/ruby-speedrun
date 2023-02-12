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
    def initialize(name, health=100)
        @name = name.capitalize
        @health = health
        puts "New player #{@name} with health of #{@health} created."
    end

    def woot()
        @health += 15
        puts "Player #{@name} got wooted!"
        #self.say_hello
    end
    
    def blam()
        @health -= 10
        puts "Player #{@name} got blammed!"
        #self.say_hello
    end

    def to_s
        "I'm #{@name} with a health of #{@health}."
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

