require_relative 'die'
require_relative 'player'

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
    end
    
end