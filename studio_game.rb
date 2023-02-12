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

class Game
    attr_reader :title
    def initialize(title)
        @title = title
        @players = []
    end
    def add_player(p)
        @players.push(p)
    end
    def play
        #calling a global variable (string in this case)
        call_game
        puts "There are #{@players.length} players in #{@title}:"
        @players.each do |p|
            puts p
        end
        @players.each do |p|
            p.blam
            p.woot
            p.woot
            puts p
        end




    end
end
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

# create new game 
knuckleheads = Game.new("Knuckleheads")
# add spme players to game
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.add_player(player4)
# run the game
knuckleheads.play

# creating new players
player5 = Player.new("alvin", 60)
player6 = Player.new("simon", 70)
player7 = Player.new("theodore", 80)

# create new game 
chipmunks = Game.new("Chipmunks")
# add spme players to game
chipmunks.add_player(player5)
chipmunks.add_player(player6)
chipmunks.add_player(player7)
# run the game
chipmunks.play