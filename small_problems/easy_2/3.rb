=begin
Create a simple tip calculator. 
The program should prompt for a bill amount and a tip rate. 
The program must compute the tip and then display both the tip and the total amount of the bill.

----------------------------------------------------------------------------------------
Input: Integer to float
Output: String concatenation 
Algorithm: Tip % / 100
           tip = bill * tip %
           total = bill + tip

=end

puts "What is the bill?"
bill = gets.to_f

puts "What is the tip percentage?"
tip_rate = gets.to_f

tip = (bill * (tip_rate / 100)).round(2)
total = (bill + tip).round(2)

puts "The tip is #{format("%.2f",(tip))}\nThe total is #{format("%.2f",(total))}"
