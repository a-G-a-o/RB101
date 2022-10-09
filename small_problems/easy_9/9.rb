=begin

Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.
Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

Numerical Score Letter	Grade
90 <= score <= 100	    'A'
80 <= score < 90	      'B'
70 <= score < 80	      'C'
60 <= score < 70	      'D'
0 <= score < 60	        'F'

Example:
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

=end

def get_grade(grade1, grade2, grade3) #alternate argument: (*grades)

  average = (grade1 + grade2 + grade3) / 3

  case average
  when 90..100 then 'A'
  when 80..90  then 'B' 
  when 70..80  then 'C'
  when 60..70  then 'D'
  else              'F'
  end
  #best interpreted as when (90..100).include?(result)
end

#Further exploration: alter the method to handle extra credit-------------
def get_grade(*grades)

  average = grades.sum / grades.size

  case average
  when 90..100 then 'A'
  when 80..90  then 'B' 
  when 70..80  then 'C'
  when 60..70  then 'D'
  when 0..60   then 'F'
  else "Above and beyond! A+"
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
