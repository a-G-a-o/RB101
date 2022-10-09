#change the begin/end/until and make sure this program doesn't

def factors(number)
  divisor = number
  factors = []
  #begin
    #factors << number / divisor if number % divisor == 0
    #divisor -= 1
  #end until divisor == 0
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

#---------------------------------------------------------------------------

#Q: WHAT IS THE PURPOSE OF THE NUMBER % DIVISOR == 0?

#A: it filters out the numbers that are not factors of number
#allows you to determine if the result is an int number without a remainder

#---------------------------------------------------------------------------

#Q: WHAT IS THE PURPOSE OF THE SECOND-TO-LAST LINE (line 8) IN THE METHOD
#(THE 'FACTORS' BEFORE THE METHOD'S 'END')?

#A: to return the factors array and have something to output once factors() is called
#if the return value is omitted, the return would be nil
