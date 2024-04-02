=begin

PROBLEM:

CustomSet class

initialize default argument is empty array
argument takes array

contains? instance method
- alias for `array#include?`

empty? instance method
- alias for `array#empty?`

subset? instance method
- empty is subset of non-empty (returns true)
- not emptys is NOT subset of non-empty (returns false)
- as long as all the elements of the set object we have
invoked `subset?` on are contained in the argued subset object returns true

disjoint? instance method
- returns true if there are no shared elements
- false if any elements are the same
- returns true if both are empty

implement eql? method? (same value and same class) 
- order of elements doesn't matter
- duplicate elements don't matter

add instance method
- add integer to array (push on to end of the array)
- can't add duplicate element

intersection instance method
- returns new customset object that contains shared elements
- returns empty new set if no shared elements

difference instance method
- returns a new set that contains elements not shared between the 2 arrays

union instance method
- returns a new set containing the elements from each set (object called on and argued object)

=end

class CustomSet
  attr_reader :set

  def initialize(set=[])
    @set = set
  end

  def empty?
    set.empty?
  end

  def contains?(element)
    @set.include?(element)
  end

  def subset?(other_set)
    count = 0
    set.each { |element| count += 1 if other_set.set.include?(element) }
    count == set.length
  end

  def disjoint?(other_set)
    set.each do |element|
      return false if other_set.set.include?(element)
    end
    true
  end

  def eql?(other_set)
    set.uniq.sort == other_set.set.sort
  end

  def add(new_ele)
    @set << new_ele unless set.include?(new_ele)
    CustomSet.new(@set)
  end

  def ==(other)
    @set == other.set
  end

  def intersection(other)
    intersection = @set.select { |element| other.set.include?(element) }
    CustomSet.new(intersection)
  end

  def difference(other)
    diff = @set - other.set
    CustomSet.new(diff)
  end

  def union(other)
    new_elements = @set + other.set
    CustomSet.new(new_elements.uniq.sort)
  end
end

# intersection instance method
# - returns new customset object that contains shared elements
# - returns empty new set if no shared elements
