# A pie is worth 5 points
# A bottle is worth 25 points
# A hammer is worth 50 points
# A skillet is worth 100 points
# A broomstick is worth 200 points
# A crowbar is worth 400 points

Treasure = Struct.new(:name, :points)

module TreasureTrove
    #const defined with all caps
    TREASURES = [
        Treasure.new(:pie, 5),
        Treasure.new(:bottle, 25),
        Treasure.new(:hammer, 50),
        Treasure.new(:skillet, 100),
        Treasure.new(:broomstick, 200),
        Treasure.new(:crowbar, 400)
    ]

    def self.random
        TREASURES.sample
    end

end