comment = "Hello World!"
puts comment.upcase

3.times do
    puts comment.downcase 
end

# just the day month year
current_date = Time.new.strftime('%m/%d/%Y')

2.times do
    puts current_date
end