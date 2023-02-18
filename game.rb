require_relative 'player'
require_relative 'die'
require_relative 'gameturn'
require_relative 'treasure_trove'

class Game
    attr_reader :title
    def initialize(title)
        @title = title
        @players = []
    end
    def add_player(p)
        @players.push(p)
    end
    #setting default rounds played to one
    def play(rounds=1)
        # an example of using the last returned value from one function (format time) as input to another function
        puts "The game has started on #{Time.now.strftime("%A %-m/%d/%Y at %-I:%M%p")}."
        puts "There are #{@players.length} players in #{@title}:"
        @players.each do |p|
            puts p
        end
        #playing rounds 1 to whatever is specified
        1.upto(rounds) do |round|
            puts "\nRound #{round}:"
            @players.each do |p|
                GameTurn.take_turn(p)
            end
        end
        #treasure stuff
        treasures = TreasureTrove::TREASURES
        treasures.each do |t|
            puts "A #{t.name} is worth #{t.points}"
        end

    end
    def print_stats
        puts "\n#{@title} Statistics:"
        strong_players, wimpy_players = @players.partition {|p| p.strong?}
        puts "\n#{strong_players.size} strong players:"
        strong_players.each do |p|
            puts "#{p.name} (#{p.health})"
        end
        puts "\n#{wimpy_players.size} wimpy players:"
        wimpy_players.each do |p|
            puts "#{p.name} (#{p.health})"
        end

        sorted_players = @players.sort_by {|p| p.score}.reverse
        puts "\n#{@title} High Scores:"
        sorted_players.each do |p|
        formatted_name = p.name.ljust(20, '.')
        puts "#{formatted_name} #{p.score}"
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