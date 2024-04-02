=begin

PROBLEM
Write a program that will take a string of digits and return all the 
possible consecutive number series of a specified length in that string.

input: string which consists of digits & an integer which forms the
length of the sequences that should be returned

should raise and Argument error if asked to generate sequences longer than
the argued string

output: array of consecutive slices of the string of the argued length

EXAMPLES
'01234' & length 1
[[0], [1], [2], [3], [4]]

=end

class Series
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def slices(n)
    raise ArgumentError if string.length < n
    string.chars.map(&:to_i).each_cons(n).to_a
  end
end