=begin

PROBLEM:
create a diamond out of capital letters

input: capital letter string

output: diamond constructed of alpha letters as the outline as a string
- each letter on a new line (append newline to every line)
- horizontally & vertically symmetric
- top hald has letters in ascending order
- bottom half has letters in descending order

- A just a single letter

EXAMPLES:
    answer = Diamond.make_diamond('C')
    string = "  A  \n"\
             " B B \n"\
             "C   C\n"\
             " B B \n"\
             "  A  \n"

             9 rows
                 string =
             "    A    \n"\ row 1 spaces 0 n: 0
             "   B B   \n"\ row 2 spaces 1 n: 1
             "  C   C  \n"\ row 3 spaces 3 n: 2
             " D     D \n"\ row 4 spaces 5 n: 3
             "E       E\n"\ row 5 spaces 7 n: 4
             " D     D \n"\ row 4 spaces 5
             "  C   C  \n"\
             "   B B   \n"\
             "    A    \n"

DATA STRUCTURE:

array of odd numbers and use the appropriate index (same as the alphabet)
[0, 1, 3, 5, 7, 5, 3, 1, 0]

ALGORITHM:
- create alphabet array, captials
- initialize variable to hold empty string, called diamond
- calculate number of rows (also number of spaces)
  - find position in alphabet array, save as top_half
  - add position in alphabet array - 1, as bottom_half
  - rows = top_half + bottom_half
- initialize a spaces variable
- iterate from 0 to top_half-1
  - if number iterating on is 0
    - add alpha_arr[num] centered on rows num with \n to diamond array
  - else
    - add alpha_arr[num] " " * spaces alpha_arr[num]
    centered with \n on rows num to diamond array
    - increment spaces by 2
- iterate from bottom_half-1 to 0
  - if number iterating on is 0
    - add alpha_arr[num] centered on rows num with \n to diamond array
  - else
    - add alpha_arr[num] " " * spaces alpha_arr[num]
    centered on rows num with \n to diamond array
    - decrement spaces by 2
- return the diamond string
=end

require 'pry'

class Diamond
  ALPHA = ("A".."Z").to_a

  def self.make_diamond(letter)
    half = ALPHA.index(letter) + 1
    rows = (half * 2) - 1

    diamond = build_top_row(rows)
    diamond += build_half(half, rows)
    diamond += diamond[0..-2].reverse
    diamond.join
  end

  class << self
    private

    def build_half(half, rows)
      diamond = []
      sp = 1
      (1..half - 1).each do |n|
        char = ALPHA[n]
        diamond << "#{"#{char}#{' ' * sp}#{char}".center(rows)}\n"
        sp += 2
      end
      diamond
    end

    def build_top_row(rows)
      ["#{'A'.center(rows)}\n"]
    end
  end
end

puts Diamond.make_diamond("B")
