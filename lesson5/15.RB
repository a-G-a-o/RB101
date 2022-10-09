#Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hsh|                     #select will return all elements for which the block is TRUE
    hsh.all? do |_, value|              #returns true if 2nd inner block is true
        value.all? do |num|             #if this is true, then the 1st inner block is true
            num.even?
        end
    end
end