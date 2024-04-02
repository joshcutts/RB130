=begin

PROBLEM:
input: argued integer

output: the sum of all multiples of the numbers
in the set (3 and 5 default) that are
less than the first number
- doesn't include highest number


EXAMPLES:
20
3, 5, 6, 9, 10, 12, 15, 18
sum = 78

DATA STRUCTURE:
- array of the set of numbers
- new array that consists of numbers in
range from 1 to argued integer - 1 that

ALGORITHM:
`to` class method
- default 3 & 5 integers in set
- empty array
- iterate from 1 to n-1
  - if evenly divisible by 3 or 5 add to (select) new array

`constructor`
- takes 2-3 integers as argument (splat)

`to` instance method
- take integers argued as array as the set
- iterate from 1 to n-1
  - evenly divisible by any of the integers in the array select
- take the sum of the multiples and return

=end

class SumOfMultiples
  attr_reader :integers

  def initialize(*ints)
    @integers = ints.size > 0 ? ints : [3, 5]
  end

  def self.to(num)
    SumOfMultiples.new(3, 5).to(num)
  end

  def to(num)
    (1..num-1).select {|n| integers.any? { |factor| n % factor == 0}}.sum
  end
end
