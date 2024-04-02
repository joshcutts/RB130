=begin

PROBLEM:
input: 
output: 

method requirements:

Element class

instance methods
datum
- returns the value of the element

tail?
returns true if there is no next element?

next
- returns next element in linked list

initialize
- first argument can be integer


SimpleLinkedList class

constructor
- optional argument
- 

- elements of linked list are of the element class
- pass integers but these should be passed again to Element constructor
instance methods

empty?
- checks if linked list is empty
returns true if empty, false otherwise

push
- add argument to list

size
- length of linked list

peek
- nil if the list is empty
- returns value of the first element of the list?

pop
- removes and returns the last element of the list

head
- returns first element from the list

from_a
- argument must be an array
- argument is converted to linked list

reverse
- reverses the order of the linked list

to_a
converts linked list to an array of elements

=end

class Element
  attr_writer :next_val

  def initialize(value, next_val=nil)
    @value = value
    @next_val = next_val
  end

  def datum
    @value
  end

  def tail?
    @next_val == nil
  end

  def next
    @next_val
  end
end

class SimpleLinkedList
  def head
    @head
  end

  def empty?
    @head.nil?
  end

  def push(element_val)
    element = Element.new(element_val, @head)
    @head = element
  end

  def size
    size = 0
    current_elem = @head
    while (current_elem)
      size += 1
      current_elem = current_elem.next
    end
    size
  end

  def peek
    @head.datum if @head
  end

  def pop
    datum = peek
    new_head = @head.next
    @head = new_head
    datum
  end

  def self.from_a(arr)
    arr = [] if arr.nil?

    list = SimpleLinkedList.new
    arr.reverse_each {|element| list.push(element)}
    list
  end

  def to_a
    arr = []
    current_elem = head
    while !current_elem.nil?
      arr.push(current_elem.datum)
      current_elem = current_elem.next
    end
    arr
  end

  def reverse
    reversed_list = SimpleLinkedList.new
    current_elem = head
    while !current_elem.nil?
      reversed_list.push(current_elem.datum)
      current_elem = current_elem.next
    end
    reversed_list
  end
end

list = SimpleLinkedList.new
(1..10).each do |datum|
  list.push(datum)
end
p list

# 6.times { list.pop }


# list = SimpleLinkedList.new
# list.push(1)
# list.push(2)
# list.push(3)
# p list
# p list.pop
# p list

# a = ["a", "b", "c"]
# a.delete_at(-1)
# p a