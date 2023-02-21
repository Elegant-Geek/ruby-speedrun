require_relative 'player'
require_relative 'die'
require_relative 'gameturn'
require_relative 'treasure_trove'
require 'csv'
module StudioGame
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
                    #references gameturn.rb
                    GameTurn.take_turn(p)
                end
            end
            #treasure stuff
            treasures = TreasureTrove::TREASURES
            treasures.each do |t|
                puts "A #{t.name} is worth #{t.points}"
            end

        end
        def load_players(from_file)            
                CSV.foreach(from_file) do |row|
                    player = Player.new(row[0], row[1].to_i)
                    add_player(player)   
            end
        end
        def high_score_entry(player)
            formatted_name = player.name.ljust(20, '.')
            "#{formatted_name} #{player.score}"
        end
        def save_high_scores(to_file="high_scores.txt")
            File.open(to_file, "w") do |file|
            file.puts "#{@title} High Scores:"
            sorted_players = @players.sort_by {|p| p.score}.reverse
            sorted_players.each do |player|
                file.puts high_score_entry(player)
            end
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
                puts high_score_entry(p)
            end
            # TIP: you can replace @players below with the sorted players if you want but it doesn't matter too much
            @players.each do |p|
                puts "\n#{p.name}'s point totals:"
                # NOTE: the value of |treasure| is being yielded (inserted) 
                # into this block below and is being called from line 55 of player.rb (yield Treasure.new(name, points)
                # so every Treasure.new gets passed in as |treasure|
                p.each_found_treasure do |treasure|
                    puts "#{treasure.points} total #{treasure.name} points"
            end
            puts "#{p.points} grand total points"
            end
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