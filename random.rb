=begin

Find the longest substring in alphabetical order.

Example: the longest alphabetical substring in `"asdfaaaabbbbcttavvfffffdf"` is `"aaaabbbbctt"`.

There are tests with strings up to `10 000` characters long so your code will need to be efficient.

The input will only consist of lowercase characters and will be at least one letter long.

If there are multiple solutions, return the one that appears first.

Good luck :)

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

=end

=begin

PROBLEM:
input: string
output: longest alphabetical substring

EXAMPLES:
p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

DATA STRUCTURE:


high level:
generate all substrings
select substrings that are in alpha order
then select longest one (sort by length)


ALGORITHM:
- create an array of all substrings
- create an array of lowercase letters from a-z
- iterate array of substrings
  - select a substring if every character index is >= the previous char index
    - iterate through the characters of a substring
- select the longest substring


=end

require 'pry'

def longest(str)
  alpha_substrings = []
  start = 0
  str.chars.each_with_index do |char, i|
    alpha_substrings << char if i == 0
    next if str[i] >= str[i-1] || i == 0
    alpha_substrings << str[start..i-1]
    start = i
  end

  if str.length > 1
    alpha_substrings << str[start..-1] if str[-1] >= str[-2]
  end
  
  alpha_substrings.max_by(&:length)
end


p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'


# def generate_substrings(string)
#   substrings = []
#   (0..string.length-1).each do |start|
#     length = string.length - start
#     (1..length).each do |l|
#       substrings << string[start, l]
#     end
#   end
#   substrings
# end

# ALPHA = ("a".."z").to_a

# def longest(string)
#   substrings = generate_substrings(string)

#   alpha_substrings = substrings.select do |substring|
#     bool_array = []
#     (1..substring.length-1).each do |i|
#       if (substring[i] >= substring[i-1])
#         bool_array << true 
#       else
#         bool_array << false
#       end
#     end
#     bool_array.all?
#   end
#   longest_length = alpha_substrings.sort_by(&:length)[-1].length
#   alpha_substrings.select {|substring| substring.length == longest_length}[0]
# end