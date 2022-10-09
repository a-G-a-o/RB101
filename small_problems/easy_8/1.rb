=begin

Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

Examples:
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

=end

def sum_of_sums(arr)
  num = 0
  sum = 0

  #loop do
    #num = num + arr[i]
    #sum += num
    #break if i == arr.size - 1
    #i += 1
  #end
  arr.each do |element|
    num += element
    sum += num
  end
  sum
end

#alternate solution
def sum_of_sums(arr)
  sum = 0
  1.upto(arr.size) do |count|
    sum += arr.slice(0, count).reduce(:+)
  end
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35