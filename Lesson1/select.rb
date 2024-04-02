def select(arr)
  counter = 0
  len = arr.length
  new_arr = []

  while counter < len
    selector = yield(arr[counter])
    new_arr.push(arr[counter]) if selector
    counter += 1
  end
  
  new_arr
end

array = [1, 2, 3, 4, 5]
a = select(array) { |num| num.odd? }
p a
b = select(array) { |num| puts num }
p b
c = select(array) { |num| num + 1 }
p c