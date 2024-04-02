=begin

PROBLEM:
input: array
output: maximum element of the array as indiacted by the block

EXAMPLES:
max_by([1, 5, 3]) { |value| value + 2 } == 5
max_by([1, 5, 3]) { |value| 9 - value } == 1
max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
max_by([-7]) { |value| value * 3 } == -7
max_by([]) { |value| value + 5 } == nil

DATA STRUCTURE:
max_by([1, 5, 3]) { |value| value + 2 } == 5
[3, 7, 5] # 7, index 1
[1, 5, 3][1] ... 5

max_by([1, 5, 3]) { |value| 9 - value } == 1
[8, 4, 6] # 8, index 0

max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
["_", "[", "]"]


ALGORITHM:
- create a new array based on the block return value
- assign the first element of the new array to a max value variable
- create an index variable and assign to 0
- iterate through the new array and compare to the max value variable, with index
- for the max value assing the appropriate index
- return the element from the original array with the index from the max value


=end


def max_by(arr)
  new_arr = []
  arr.each { |element| new_arr << yield(element) }

  max = new_arr[0]
  idx = 0

  new_arr.each_with_index do |element, index|
    if element > max
      max = element 
      idx = index
    end
  end
  arr[idx]
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil