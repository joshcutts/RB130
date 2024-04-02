=begin

PROBLEM:
input: integer
Octal object

output: decimal output
need to return 0 for invalid input (non number) 

EXAMPLES:

233 (decimal)

octal 155


DATA STRUCTURE:


ALGORITHM:
- create local variable 0 to add to for decimal result 
- need to find 1st power to raise 10 to
  - increment power until divisor using divmod < 10
- start at the power identified previously
  - take octal num and divmod by 8 raised to power
  - take evenly divisible num and multiply by 8 to power -> add to decimal result
  - decrease power by 1
  - break when power < 0
- return the decimal num


=end

require 'pry'

class Octal
  attr_reader :octal

  def initialize(octal)
    if octal.match?(/[a-z]/i)
      @octal = 0
    else
      @octal = octal.to_i
    end
  end

  def to_decimal
    return 0 if @octal < 10 && @octal > 1
    decimal = 0
    power = 0
    multiplier = 11
    while multiplier >= 10
      power += 1
      multiplier, remainder = octal.divmod(10 ** power)
    end
    remainder = 0
    num = octal
    loop do
      multiplier, remainder = num.divmod(10 ** power)
      return 0 if power == 1 && remainder > 8
      decimal += multiplier * (8 ** power)
      num = remainder
      power -= 1
      break if power == 0
    end
    decimal + remainder
  end
end

# p 6789.divmod(10**3)
# p 789.divmod(10**2)
# p 89.divmod(10**1)

# p 9.divmod(10)

# p 2047.divmod(10**3)
# p 47.divmod(10**2)