greeting = "Welcome!"

3.times do
    puts greeting.upcase
end

# current_time = Time.new.strftime('%-I:%M%p')
# current_date = Time.new.strftime('%-m/%d/%y')
# weekday = Time.new.strftime('%A')
# puts "The game started on #{weekday} #{current_date} at #{current_time}."

# store current time then format it all in one line under a new variable! Easier way of doing it.
current_time = Time.now
formatted_time = current_time.strftime("%A %m/%d/%Y at %I:%M%p")
puts "The game started on #{formatted_time}"


name1 = "Larry"
health1 = 60
name2 = "Curly"
health2 = 125
name3 = "Moe"
health3 = 100
name4 = "Shemp"
health4 = 90

puts "\n#{name1}'s initial health is #{health1}."
puts "#{name2.upcase} has a health of #{health2}."
puts "#{name3} has a health of #{health3}.".center(50, '*')
puts "#{name4.ljust(30, '.')} #{health4} health"


puts "Players:\n#{name1}\n#{name2}\n#{name3}\n#{name4}"


