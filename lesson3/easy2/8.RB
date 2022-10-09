=begin

Shorten the following sentence:

advice = "Few things in life are as important as house training your pet dinosaur."
Bonus: Use String#slice! to make the return value "Few things in life are as important as ". 
But leave the advice variable as "house training your pet dinosaur.".

=end

advice = "Few things in life are as important as house training your pet dinosaur."

new_advice = advice.slice!(0, advice.index('house'))
p new_advice

#using String#slice will leave the original string unaltered