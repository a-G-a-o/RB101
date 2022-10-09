=begin

Write a function named xor that takes two arguments, and returns true if exactly one of it arguments is truthy, false otherwise. 
Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.

Example output:

xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false

input: two booleans
output: boolean
algorithm: false if boolean1 is true && boolean2 is true
           else return true

=end

def xor?(bool1, bool2)
  return true if (bool1 && !bool2) || (bool2 && !bool1)
  #return true if bool2 && !bool1
  false
end

p xor?(5.even?, 4.even?)
p xor?(5.odd?, 4.odd?)
p xor?(5.odd?, 4.even?) 
p xor?(5.even?, 4.odd?)


=begin
Shorter version:

def xor?(value1, value2)
  !!((value1 && !value2) || (value2 && !value1))
end

Other idiomatic ways:

def xor?(p, q)
  (p || q) && !(p && q)
end

def xor?(this, that)
  (this || that) != (this && that)
end

=end