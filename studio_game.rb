# --------------------------------display options for name and health: -------------------------------------
# puts "\n#{name1}'s initial health is #{health1}."
# puts "#{name2.upcase} has a health of #{health2}."
# puts "#{name3} has a health of #{health3}.".center(50, '*')
# puts "#{name4.ljust(30, '.')} #{health4} health"
# puts "Players:\n#{name1}\n#{name2}\n#{name3}\n#{name4}"

require_relative 'player'
require_relative 'game'

# creating new players
# player1 = Player.new("larry", 60)
# player2 = Player.new("curly", 125)
# # moe takes default health value
# player3 = Player.new("moe")
# player4 = Player.new("shemp", 90)
# create new game 
knuckleheads = Game.new("Knuckleheads")
# takes cmd line argument given or if none given use a default file
knuckleheads.load_players(ARGV.shift || "players.csv")
# add spme players to game

loop do
    puts "\nHow many game rounds? ('quit' to exit)"
    answer = gets.chomp.downcase
    case answer
    when /^\d+$/
        # run the game, converts input to integer (always +)
        knuckleheads.play(answer.to_i)
    when 'quit', 'exit', 'q'
        knuckleheads.print_stats
        break
    else
        'Please enter a number or type quit'
    end
end
knuckleheads.save_high_scores


