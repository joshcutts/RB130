def compute(arg)
  if block_given?
    yield(arg)
  else
    "Does not compute"
  end
end

p compute(5) { |par| par } == 5
p compute("hi") { |str| str + " there"} == 'hi there'
p compute("2") == 'Does not compute'