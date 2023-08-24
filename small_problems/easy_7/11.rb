=begin

Write a method that counts the number of occurrences of each element in a given array.
The words in the array are case-sensitive: 'suv' != 'SUV'. 
Once counted, print each element alongside the number of occurrences.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

INPUT: array
OUTPUT: print out hash
Explicit exp: strings in array are all case sensitive
Implicit exp: return a new object

Algorithm:  START
            SET new empty hash
            GET vehicles array and parse through array using each method |string|
              set string as new key if hash does not contain string
              increment value of key if hash does contain string

            PRINT hash
            END

=end

def count_occurrences(arr)
  hsh = {}

  #arr.each do |element|
  #  hsh.include?(element) ? hsh[element] += 1 : hsh[element] = 1
  #end

  arr.uniq.each do |element|
    hsh[element] = arr.count(element)

  hsh.each do |element, count|
    puts "#{element} => #{count}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck',
  'suv', 'TRUCK'
]

count_occurrences(vehicles)

#Further exploration: Try to solve the problem when words are case insensitive, e.g. "suv" == "SUV".
def count_occurrences(arr)
  case_insensitive = arr.map(&:downcase)
  
  case_insensitive.uniq.each do |element|
    hsh[element] = arr.count(element)
  end

  #arr.map(&:downcase).tally.each { |element, count| puts "#{element} => #{count}" }

  hsh.each do |element, count|
    puts "#{element} => #{count}"
  end
end
