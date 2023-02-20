require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'

module GameTurn
    def self.take_turn(p)
            # moved from play method in game class
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
            
            treasure = TreasureTrove.random
            # assigns the variable treasure to the players treasure/point hash using the .found_treasure method!
            p.found_treasure(treasure)
            # puts "#{p.name} found a #{treasure.name} worth #{treasure.points} points."
    end
    
end