def step(start, done, increm)
  num = start
  while num <= done
    yield(num)
    num += increm
  end
  num
end


step(1, 10, 3) { |value| puts "value = #{value}" }