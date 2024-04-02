=begin

PROBLEM:
input: positive integer
output:
raise StandardError if argued integer < 0

sum of divisors is aliquot sum (exlucde self)
return "perfect" if aliquot sum == num
return "deficient" if aliquot sum < num
return "abundant" if aliquot sum < num

EXAMPLES:
6 is perfect
1 + 2 + 3 = 6

28 is perfect
1 + 2 + 4 + 7 + 14

15 is deficient
1 + 3 + 5 = 9

24 is abundant
1 + 2 + 3 + 4 + 6 + 8 + 12

prime numbers , 7, 13, etc
are always deficient since divisor is 1


DATA STRUCTURE



ALGORITHM
- create factors array with number 1 in it
- iterate from 2 to half of number
  - if the current number is a factor, add it to factors array
- aliquot sum is sum of the factors array
- if number is equal to aliquot sum return "perfect"  
- if number is less than aliquot sum return "deficient"
- if number is greater than aliquot sum return "abundant"


=end

class PerfectNumber
  def self.classify(num)
    raise StandardError.new if num < 0

    factors = (1..num/2).each_with_object([]) {|n, arr| arr << n if num % n == 0}
    aliquot_sum = factors.sum

    if aliquot_sum == num
      "perfect"
    elsif aliquot_sum < num
      "deficient"
    elsif aliquot_sum > num
      "abundant"
    end
  end
end

