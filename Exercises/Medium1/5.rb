items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering"
end

# gather(items) do |*three, one|
#   puts three.join(', ')
#   puts one
# end

# gather(items) do |one, *two, three|
#   puts one
#   puts two.join(', ')
#   puts three
# end

# gather(items) do |one, *three|
#   puts one
#   puts three.join(', ')
# end

gather(items) do |one, two, three, four|
  puts "#{one} #{two}, #{three}, #{four}"
end