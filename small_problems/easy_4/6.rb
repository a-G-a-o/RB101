=begin

Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

Example output:
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

Further exploration:
Try solving this problem using Enumerable#each_with_object or Enumerable#inject (note that Enumerable methods can be applied to Arrays).

Input: array of integers
Output: array 
Algorithm:  #correct algorithm --------------------------------------
            initalize sum variable
            use .map to return new array
              within the block add each num to sum 

            #brute force way ----------------------------------------
            initalize i and j
            unless i == array size (break statement needed)

              move array1[i] to array2
              add array1[j] to array2[i] and save sum as array2[j]
              i += 1
              j += 1
            return array2

=end

def running_total(array)
  sum = 0
  array.map { |num| sum += num }
end

#Further exploration:-----------------------------------------------
#using Enumerable#each_with_object
def running_total2(array)
  sum = 0
  array.each_with_object([]) do |number, array2|
    array2 << (sum += number)
  end
end

#using Enumerable#inject
def running_total3(array)
  array2 = []
  
  array.inject(0) do |sum, number|
    array2[array2.length] = sum + number
  end
  array2
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p unning_total([3]) == [3]
p running_total([]) == []