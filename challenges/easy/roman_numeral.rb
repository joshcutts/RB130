=begin



PROBLEM:
input: integer in RomanNumeral object
`to_roman` instance method
output: 
instance method `to_roman` returns
roman numeral represenation of argued integer


EXAMPLES

1    => I
5    => V
10   => X
50   => L
100  => C
500  => D
1000 => M


1  => I
10  => X
7  => VII
 
1990
1000=M
900=CM
90=XC


2008
2000=MM
8=VIII

DATA STRUCTURE:
divmod 
hash converting integer to letter for roman numeral
converstion = {1 => "I", 5 => "V", }

ALGORITHM
constructor 
assign integer to an instance variable

`to_roman`
- create an empty string to populate
- create new local number variable to operate on
- iterate through the conversion hash, dividing by integer values (keys)
use remainder for next iteration to divide by
  - on each iteration add the evenly divisible number for each value
- return the string for roman numeral

=end

require 'pry'

class RomanNumeral
  CONVERSION = {1000 => "M", 500 => "D", 100 => "C", 50 => "L", 10 => "X", 5 => "V", 1 => "I"}
  NUMERALS = CONVERSION.values
  def initialize(num)
    @num = num
  end

  def to_roman
    roman_numeral = ""
    number = @num

    CONVERSION.each.with_index do |(integer, rom_num), index|
      multiplier, remainder = number.divmod(integer)
      if multiplier == 4
        if roman_numeral[-1] == NUMERALS[index-1]
          roman_numeral[-1] = rom_num + NUMERALS[index-2]
        else
          roman_numeral << rom_num + NUMERALS[index-1]
        end
      else
        roman_numeral << rom_num * multiplier
      end
      number = remainder
    end
    roman_numeral
  end
end

num = RomanNumeral.new(9)
num.to_roman