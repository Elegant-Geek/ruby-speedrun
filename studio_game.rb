# --------------------------------display options for name and health: -------------------------------------
# puts "\n#{name1}'s initial health is #{health1}."
# puts "#{name2.upcase} has a health of #{health2}."
# puts "#{name3} has a health of #{health3}.".center(50, '*')
# puts "#{name4.ljust(30, '.')} #{health4} health"
# puts "Players:\n#{name1}\n#{name2}\n#{name3}\n#{name4}"

require_relative 'player'
require_relative 'game'

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

