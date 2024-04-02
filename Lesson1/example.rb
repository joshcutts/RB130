
# how does this work?

def some_method(&name)
  name.call
end


some_method { puts "hi"}


my_proc = Proc.new { puts "I'm a proc"}

some_method(&my_proc)