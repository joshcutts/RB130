=begin

PROBLEM:
robots need randomly generated name

input:
Robot class
name instance method
reset instance method

output:
Robot class
name instance method
names can't have collisions
different robots have different names

reset method creates new random name

name must have 1st 2 characters capital alpha chars
follows by 3 number characters

EXAMPLES:

DATA STRUCUTRE:

avoid name collisions
- add each robot name to an array stored in a class variable

ALGORITHM:
add name getter method
CONSTANTS
- create array of capital letters
- create array of digits 0-9
CLASS VARIABLE
- robot names and empty array

initialize
- call private method that generates random robot name,
sets equal to name instance variable

generate_name
- create emtpy string to hold robot name
- start a loop
  - 2 times, randomly sample a letter from alpha array
  and add to robot name string
  - 3 times randomly sample a digit and add to robot name
  - if the generate robot name is not already assigned, break from loop
  - reset robot name to empty string
- add robot name to array of robot names (class variable)
- return robot name

reset
- call private method that generates random robot name

=end

class Robot
  attr_reader :name

  ALPHA = ("A".."Z").to_a
  DIGITS = (0..9).to_a.map(&:to_s)
  @@robot_names = []

  def initialize
    @name = generate_name
  end

  def reset
    @@robot_names.delete(@name)
    @name = generate_name
  end

  private

  def generate_name
    robot_name = ''
    loop do
      2.times { robot_name << ALPHA.sample }
      3.times { robot_name << DIGITS.sample }
      break unless @@robot_names.include?(robot_name)
      robot_name = ''
    end
    @@robot_names << robot_name
    robot_name
  end
end
