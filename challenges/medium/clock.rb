=begin

PROBLEM:
create a clock that is independent of date

You should be able to add minutes to and subtract minutes from the time
represented by a given Clock object. Note that you should not mutate Clock
objects when adding and subtracting minutes -- create a new Clock object.

input: one OR two integers
output:

at (class method)
time in minutes
24Hr time

to_s
formatted time
hh:min

ALGORITHM:

at class method - two arguments; returns a clock object
- convert hr argument (1st) to minutes (* 60)
- default second argument is 0
- return total minutes by adding hr minutes (converted above)
+ actual minutes (second argument)

to_s instance method
convert minutes instance variable in clock object
(returned by at method) to correct format
- divmod 60 save as hrs and minutes
- format making sure minute and hours have preceding 0 where necessary

+ instance method (protected)
- add the argument to the minutes instance variable
- returns a new clock object

== instance method
returns true if the minutes are equal to minutes in another clock object

=end

class Clock
  attr_reader :total_minutes

  def initialize(mins)
    @total_minutes = mins
  end

  def self.at(hr, min=0)
    hr = 24 if hr == 0
    total_mins = (hr * 60) + min
    total_mins = (24 * 60) if total_mins == 0
    Clock.new(total_mins)
  end

  def to_s
    hrs, mins = @total_minutes.divmod(60)

    while hrs >= 24 || hrs < 0
      hrs >= 24 ? hrs -= 24 : hrs += 24
    end
    format("%02d:%02d", hrs, mins)
  end

  def +(minutes)
    Clock.new(@total_minutes + minutes)
  end

  def -(minutes)
    Clock.new(@total_minutes - minutes)
  end

  def ==(other_clock)
    @total_minutes == other_clock.total_minutes
  end
end
