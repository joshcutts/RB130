def birds(arr)
  yield arr
end

bird_arr = %w(raven finch hawk eagle)

birds(bird_arr) do |_, _, *raptors| 
  puts "Raptors: #{raptors.join(', ')}"
end

# def types(birds)
#   yield birds
# end

# birds = %w(raven finch hawk eagle)

# types(birds) do |_, _, *raptors|
#   puts "Raptors: #{raptors.join(', ')}."
# end