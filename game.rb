require_relative 'player'
require_relative 'die'

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

        # an example of using the last returned value from one function (format time) as input to another function
        puts "The game has started on #{Time.now.strftime("%A %-m/%d/%Y at %-I:%M%p")}."
        puts "There are #{@players.length} players in #{@title}:"
        @players.each do |p|
            puts p
        end
        @players.each do |p|
            die = Die.new
            number_rolled = die.roll
            if number_rolled < 3
                p.blam
              elsif number_rolled < 5
                puts "#{p.name} was skipped."
              else
                p.woot
              end
            # p.blam
            # p.woot
            # p.woot
            puts p
        end
    end
end


if __FILE__ == $0
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
end