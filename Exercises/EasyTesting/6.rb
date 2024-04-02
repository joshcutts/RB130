require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

NoExperienceError = Class.new(StandardError)

class Employee
  def hire
    raise NoExperienceError, "Has not experience"
  end
end


class TestExample < Minitest::Test
  def test_exception
    employee = Employee.new
    assert_raises NoExperienceError do 
      employee.hire
    end
  end
end