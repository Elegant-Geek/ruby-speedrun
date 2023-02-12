name1 = "larry"
health1 = 60
name2 = "curly"
health2 = 125
name3 = "moe"
# health3 = 100
name4 = "shemp"
health4 = 90
# --------------------------------display options for name and health: -------------------------------------
# puts "\n#{name1}'s initial health is #{health1}."
# puts "#{name2.upcase} has a health of #{health2}."
# puts "#{name3} has a health of #{health3}.".center(50, '*')
# puts "#{name4.ljust(30, '.')} #{health4} health"

def say_hello(name, health=100)
    "I'm #{name.capitalize} with a health of #{health} as of #{format_time}."
end

# store current time then format it all in one line under a new variable! 
def format_time
    current_time = Time.now
    formatted_time = current_time.strftime("%A %-m/%d/%Y at %-I:%M%p")
    # puts "The game started on #{formatted_time}"
end

puts say_hello(name1, health1)
puts say_hello(name2, health2)
puts say_hello(name3)
puts say_hello(name4, health4)


# puts "Players:\n#{name1}\n#{name2}\n#{name3}\n#{name4}"


