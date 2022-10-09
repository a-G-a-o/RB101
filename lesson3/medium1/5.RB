
def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"

#'limit' isn't defined within the scope of fib(), so in order for it to work, you can make limit a CONSTANT or 
#define it as an argument. 