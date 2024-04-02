# def count(*elements)
#   counter = 0
#   elements.each do |element|
#     counter += 1 if yield(element)
#   end
#   counter
# end

def count(*elements)
  elements.inject(0) do |sum, element| 
    sum += 1 if yield(element)
    sum
  end
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3