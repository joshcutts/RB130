factorial = Enumerator.new do |yielder|  
  accumulator = 1
  number = 0
  loop do
      accumulator = number.zero? ? 1 : accumulator * number
      yielder << accumulator
      number += 1
    end
end

factorial.each_with_index do |val, index|
  puts "#{index}: #{val}"
  break if val > 7
end