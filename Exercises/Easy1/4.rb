=begin

PROBLEM:
input: integer
output: array of integers which are positive divisors of the argued integer

EXAMPLES:
divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

=end

require 'pry'

def divisors(num)
  return [1] if num == 1

  result = [1, num]
  all_nums = (2..Math.sqrt(num)).to_a
  
  all_nums.each do |n|
    if (num % n == 0)
      result << n 
      result << (num / n) unless result.include?((num / n))
    end
  end
  
  result.sort
end

def time_it
  start_time = Time.now
  yield if block_given?
  end_time = Time.now
  puts "Took #{end_time - start_time} sec."
end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) #== [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

time_it { p divisors(999962000357) == [1, 999979, 999983, 999962000357]}