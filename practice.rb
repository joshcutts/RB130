def compare(str, &block)
  puts "Before: #{str}"
  after = block.call(str) if block_given?
  puts "After: #{after}"
end

# compare("hello") { |str| str.upcase }

# after_proc = Proc.new { |str| str.upcase}

# def compare(str, &after)
#   puts "Before: #{str}"
#   after = after.call(str)
#   puts "After: #{after}"
# end

# compare("hello", &after_proc)



# def how_long_did_it_take
#   time_before = Time.now
#   yield
#   time_after = Time.now
# puts "It took #{time_after - time_before} seconds"
# end

# how_long_did_it_take { 1000.times {10000 * 10000}}


# name = "josh"
# some_proc = Proc.new {puts "#{name}"}
# def name
#   print "zach"
# end
# some_proc.call


# some_proc = Proc.new { puts "hello" }
# another_proc = proc { puts "hello there" }
# yet_another_proc = -> { puts "hello there general kenobi" }
# stubby_proc = ->(n) { puts "hello there #{n}" }

# some_proc.call
# another_proc.call
# yet_another_proc.call
# stubby_proc.call("anakin")

# def amplifier
#   number_of_exclamation_points = 0
#   amplifier = Proc.new do
#     number_of_exclamation_points += 1
#     "louder" + ("!" * number_of_exclamation_points)
#   end
# end

# a = amplifier
# puts a.call
# puts a.call
# puts a.call

# def test2(block)
#   puts "hello"
#   block.call
#   puts "good-bye"
# end

# def test(&block)
#   puts "1"
#   test2(block)
#   puts "2"
# end

# test { puts "xyz" }

# def proc_me(&my_proc) # an & was added here
#   puts my_proc.class
# end

# def block_me(&my_block)
#   puts my_block.class
# end

# proc_me(&Proc.new { puts "hi" }) # an & was added here
# block_me { puts "hi" }

# mult = lambda { |x| x*2}

# p [1, 2, 4].map(&mult)

# def a_method(&some_a_proc)
#   some_a_proc.call
# end

# pr = Proc.new { puts 'hi' }

# a_method(&pr)


# def add_exclamation(str)
#   new_str = str + "!"
#   yield(new_str)
#   new_str
# end

# add_exclamation("hello") { |new_new| puts new_new}

# def explicit_block(&block)
#   puts "What is this thing: #{block.class}"
#   block.call
# end

# explicit_block { puts "hi" }

# def call_this
#   yield(2)
# end

# # your code here

# to_s = Proc.new { |n| n}
# to_i = Proc.new { |x| x.to_s}
  
# p call_this(&to_s) # => returns 2
# p call_this(&to_i) # => returns "2"

# def block_method(animal)
#   yield(animal)
# end

  

# block_method('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# # This is a turtle and a 

# puts "hel#{nil}lo"

# def some_method(&block)
#   block_given? # we want this to return `true`
#   # puts "#{block.class}"
# end

# bloc = proc { puts "hi" } # do not alter this code

# p some_method(&bloc)

# def some(&block)
#   yield
# end

# bloc = proc { p "hi" } # do not alter

# some(&bloc)


# def lambda_return
#   puts "Before lambda call."
#   lambda {return}.call
#   puts "After lambda call."
# end

# def proc_return
#   puts "Before proc call."
#   proc {return}.call
#   puts "After proc call."
# end

# lambda_return #=> "Before lambda call."

# #=> "After lambda call."

# proc_return #=> "Before proc call."

def zip(arr1, arr2)
  zipped_arr = []
  arr1.each_index do |i|
    zipped_arr << [arr1[i], arr2[i]]
  end
  zipped_arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]