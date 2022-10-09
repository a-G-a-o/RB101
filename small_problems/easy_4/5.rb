=begin

Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. 
For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

Example output:
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33

Further exploration:
Investigate Enumerable.inject (also known as Enumerable.reduce)
How might this method be useful in solving this problem? (Note that Enumerable methods are available when working with Arrays.) 
Try writing such a solution. Which is clearer? Which is more succinct?

=end

#launch school solution
def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(max_value)
  sum = 0
  1.upto(max_value) do |number|
    if multiple?(number, 3) || multiple?(number, 5)
      sum += number
    end
  end
  sum
end

#my solution
def multisum(number)
  sum = 0
  i = 1

  loop do
    sum += i if i % 3 == 0 || i % 5 == 0
    break if i == number
    i += 1
  end

  sum
end

#idiomatic solution:
def multisum(num)
	(1..num).select {|i| i % 3 == 0 || i % 5 == 0 }.sum
end

#further exploration:
def multisum(number)
  (1..number).inject(0) do |sum, i| 
		(i % 3 == 0) || (i % 5 == 0) ? sum += i : sum += 0
	end
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33