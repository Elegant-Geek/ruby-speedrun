require_relative 'player'
require_relative 'spec_helper'
require_relative 'gameturn'

# has a capitalized name
# has an initial health
# has a string representation
# computes a score as the sum of its health and length of name
# increases health by 15 when w00ted
# decreases health by 10 when blammed

describe Player do
# code here
before do
    @player = Player.new("larry", 150)
    @initial_health = @player.health
end

it "has a capitalized name" do
    @player.name.should == "Larry"
end

it "has a initial health of 150" do
    # @player.health.should == 150
    @initial_health.should == 150
end

it "has a string representation" do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))
    # score is health + points so 150 health + 50 + 50 points = 250
    # @player.to_s.should == "I'm Larry with a health of 150 and a score of 250."
    @player.to_s.should == "I'm Larry with health = 150, points = 100, and score = 250."
end

it "computes a score as the sum of its health and points" do
    # score is health + points so 150 health + 50 + 50 points = 250
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.score.should == 250
end

it "increases health by 15 when w00ted" do
    @player.woot
    @player.health.should == @initial_health + 15
end

it "decreases health by 10 when blammed" do
    @player.blam
    @player.health.should == @initial_health - 10
end
# new code to check hash -------------------------
it "computes points as the sum of all treasure points" do
    @player.points.should == 0
  
    @player.found_treasure(Treasure.new(:hammer, 50))
  
    @player.points.should == 50
  
    @player.found_treasure(Treasure.new(:crowbar, 400))
  
    @player.points.should == 450
  
    @player.found_treasure(Treasure.new(:hammer, 50))
  
    @player.points.should == 500
  end

  it "computes a score as the sum of its health and points" do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))
  
    @player.score.should == 250
  end
# -----------------------------------------------------
# add custom iterator
it "yields each found treasure and its total points" do
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
  
    yielded = []
    @player.each_found_treasure do |treasure|
      yielded << treasure
    end
  
    yielded.should == [
      Treasure.new(:skillet, 200),
      Treasure.new(:hammer, 50),
      Treasure.new(:bottle, 25)
   ]
  end
# -----------------------------------------------------
context "strong player" do
    before do
        @player = Player.new("larry", 150)
        @initial_health = @player.health
    end
    it "is a strong player" do
        @player.should be_strong
    end
end

context "wimpy player" do
    before do
        @player = Player.new("larry", 100)
        @initial_health = @player.health
    end
    it "is a wimpy player" do
        @player.should_not be_strong
    end
end

end



