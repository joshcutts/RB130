=begin

PROBLEM:
construct objects that represent a meetup date

input: month number & year
first, second, third, fourth, fifth, last, teenth
case insensitve
teenth along with day of week only occurs 1 time per month
ex. teenth wednesday in Oct 2023

2nd Wednesday of May 2021

provide date & months (as integers) to constructor method

day instance method
2 parameters
1. day of week
2. first, second, third etc.

output: determine the exact date of the meeting
12th May 2021

EXAMPLES:

DATA STRUCTURE:
dates

ALGORITHM:

=end

require 'date'

class Meetup
  TEENTH = (13..19).to_a
  DAY_NUM = {
    "monday" => 1,
    "tuesday" => 2,
    "wednesday" => 3,
    "thursday" => 4,
    "friday" => 5,
    "saturday" => 6,
    "sunday" => 0
  }
  ORDER_TO_INT = {
    "first" => 0,
    "second" => 1,
    "third" => 2,
    "fourth" => 3,
    "fifth" => 4,
    "last" => -1
  }

  def initialize(year, month)
    start_day = Date.new(year, month, 1)
    end_day = Date.new(year, month, -1)
    @month_days = (start_day..end_day).to_a
  end

  def day(day_name, selector)
    day_num = DAY_NUM[day_name.downcase]
    n = ORDER_TO_INT[selector.downcase]
    week_days = @month_days.select { |day| day.wday == day_num }
    if selector.downcase == "teenth"
      week_days.select { |day| TEENTH.include?(day.day) }[0]
    else
      week_days[n]
    end
  end
end
