# def count(arr)
#   counter = 0
#   arr.each { |el| counter += 1 if yield(el) }
#   counter 
# end

def count(arr)
  counter = 0
  for el in arr do
    counter += 1 if yield(el)
  end
  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2