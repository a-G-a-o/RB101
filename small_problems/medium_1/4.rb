require 'pry'

=begin

You have a bank of switches before you, numbered from 1 to n. 
Each switch is connected to exactly one light that is initially off. 
You walk down the row of switches and toggle every one of them. 
You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. 
On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. 
You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, 
and returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:
  round 1: every light is turned on
  round 2: lights 2 and 4 are now off; 1, 3, 5 are on
  round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
  round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
  round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
  The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

INPUT: one integer arg, total number of switches
OUTPUT: returns Array of integers
EXPL EXP: lights are all on at first pass, each pass starts at index 0 + 1 then loop
IMPL EXP: second pass over a switch turns it on

ALGORITHM:  initalize index array and switch array
            loop and fill index array with all 'O'
                     fill switch array with integer numbers from 1..num
            initalize i
            while i < num
              initialize j
              while i * j < num
                  array[i * j] == 'O'? 'O' : 'X'
                   
=end

def toggle_switches(num)
  switches = []
  index_arr = []
  switches = fill_switches(switches, num)

  idx = 0
  while idx < num
    i += 1
    multiplier = 1
    n = i * multiplier
 
    if n < num
      switches[n] == 'O' ? switches[n] = 'X' : switches[n] = 'O'
      multiplier += 1
    end
  end

  
end

def fill_switches(array, num)
  i = 0
  for i in i..(num - 1)
    array[i] = 'O'
  end
  array
end

def extract_index(switches)
  index = []
  switches.each_index do |x|
    index << x if switches[x] == 'O'
  end
  index
end

p toggle_switches(5)