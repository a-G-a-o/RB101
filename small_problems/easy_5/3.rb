=begin

Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. 
Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

Example output:
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

Further Exploration:
How would these methods change if you were allowed to use the Date and Time classes?

=end

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time) 
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
	#this would be true for "00:00"	as after 0 % 1440

  delta_minutes
end

#Further Exploration:----------------------------------------------
HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

require 'date'

def after_midnight(time)
  d = DateTime.parse(time)
  d.hour * MINUTES_PER_HOUR + d.min
end

def before_midnight(time)
  minutes = after_midnight(time)
  minutes = MINUTES_PER_DAY - minutes if minutes > 0
  minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0