# Given the following data structure, return a new array containing the same sub-arrays 
# as the original but ordered logically by only taking into consideration the odd numbers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

#should look like this => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

arr.sort_by! do |sub_array|
    sub_array.select do |num|
        num.odd?
    end
end

p arr

#since the first digits are all the same and the second digits are all even
#we sort based on the 3rd odd digit