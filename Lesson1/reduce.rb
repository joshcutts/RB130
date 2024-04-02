def reduce(arr, default = 0)
  counter = 0
  len = arr.length
  sum = default

  while counter < len
    sum = yield(sum, arr[counter])
    counter += 1
  end

  sum
end

array = [1, 2, 3, 4, 5]
p reduce(array) { |acc, num| acc + num }
p reduce(array, 10) { |acc, num| acc + num }
p reduce(array) { |acc, num| acc + num if num.odd? }