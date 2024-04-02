# Group 1 - Procs
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# puts outputs proc object, can only get proc output by invoking it using `call`


# Group 2 - lambas
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# lamba is a proc object
# but if you don't provide correct number of arugments you raise an error - ArgumentError

# # Group 3 - blocks and methods
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# this is a method - ok to use a block with a method but not provide the right argument #
# however error raised here because we have not provided a block but have a yield
# could fix this by invoking the `Kernel#block_given?` method

# # Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# initial block/method invocation ok
# second one is ok too, however a second argument is not passed to the `yield` within
# the `block_method` method, therefore the block parameter `seal` points to `nil`.

# The third invocation of `block_method_2` is problematic, because we try to invoke
# the `animal` method local variable from wihtin the block. This is problematic because
# methods have their own self-contained scope, therefore `animal` is inaccessible from
# the block. Which is why the error (NameError) is raised.