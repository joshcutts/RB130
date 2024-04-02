=begin

PROBLEM:
input: sorted array of integers
output: array that includes all missing integers in order between 1st and last
elements of the argument

EXAMPLES:
missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []


=end

# def missing(arr)
#   all_nums = (arr[0]..arr[-1]).to_a
#   all_nums - arr
# end

# def missing(array)
#   array.each_cons(2) {|first, second| p "#{first+1} #{second-1}"}
# end

def missing(array)
  result = []
  all_nums = (array[0]..array[-1])
  all_nums.each do |num|
    result << num if !array.include?(num)
  end
  result
end

p missing([-3, -2, 1, 5]) #== [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []