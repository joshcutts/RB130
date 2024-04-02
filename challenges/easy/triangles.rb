=begin

PROBLEM:
input:
triangle object takes 3 arguments for new triangle object (sides)


output: triangle classification based on sides and invoking `kind` method
equilateral when all sides are equal
isoscleses for valid triangle with 2 equal sides
scalene for valid triangle

raises argument error for invalid triangle
- valid triangle is when any two sides are greater than the third



EXAMPLES

=end

class Triangle
  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
    raise ArgumentError if @s1 < 0 || @s2 < 0 || @s3 < 0
    raise ArgumentError if @s1.nil? || @s2.nil? || @s3.nil?
    raise ArgumentError if !valid
  end

  def kind
    if @s1 == @s2 && @s2 == @s3 && @s3 == @s1
      "equilateral"
    elsif @s1 == @s2 || @s2 == @s3 || @s3 == @s1
      "isosceles"
    else
      "scalene"
    end
  end

  def valid
    if @s1 + @s2 > @s3 && @s2 + @s3 > @s1 && @s3 + @s1 > @s2 
      true
    else
      false
    end
  end
end