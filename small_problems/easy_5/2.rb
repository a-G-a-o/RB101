=begin

The time of day can be represented as the number of minutes before or after midnight. 
If the number of minutes is positive, the time is after midnight. 
If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). 
Your method should work with any integer input.

You may not use ruby's Date and Time classes.

Example output:
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

=end

# launch school solution -------------------------------------------------
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

=> My solution -----------------------------------------------------------
def time_of_day(time)
  hours, minutes = time.divmod(60)

  while hours < 0
    hours = 24 - (-hours)
  end

  while hours > 24
    hours = hours - 24
  end
  format('%02d:%02d', hours, minutes)
end

#Further Exploration 1:--------------------------------------------
#=> Write a single calculation with % that performs the entire normalization operation in one line of code.    
    
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def time_of_day(delta_minutes)
  delta_minutes = delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

#Further Exploration 2:---------------------------------------------
#=> Rewrite the code using Date and Time classes    

def time_of_day(delta_minutes)
  time = Time.new(2022, 1, 1)
  time += (delta_minutes * 60)
  time.strftime("%H:%M")
end

#Further Exploration 2:---------------------------------------------
#=> Rewrite the code again to include the day of the week     

modify time.strftime("%A, %H:%M")
