require_relative 'player'

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
end

it "has a capitalized name" do
    @player.name.should == "Larry"
end

it "has a initial health of 150" do
    @player.health.should == 150
end

it "has a string representation" do
    @player.to_s.should == "I'm Larry with a health of 150 and a score of 155."
end

it "computes a score as the sum of its health and length of name" do
    @player.score.should == 155
end

it "increases health by 15 when w00ted" do
    @player.woot
    @player.health.should == 165
end

it "decreases health by 10 when blammed" do
    @player.blam
    @player.health.should == 140
end

end