# _____ METHODS ______ #
def clear_screen
  Kernel.system('clear')
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  if number.to_i <= 0 || number.to_f <= 0
    false
  elsif number.to_i().to_s() == number || number.to_f().to_s() == number
    true
  else
    false
  end
end

def check_number_validity(num)
  if valid_number?(num)
    true
  else
    prompt("Not a valid entry. Try again.")
  end
end

def get_amount
  loan_amount = ''

  loop do
    prompt("Enter loan amount:")
    loan_amount = Kernel.gets().chomp()

    break if check_number_validity(loan_amount)
  end

  loan_amount
end

def annual_to_monthly(number)
  annual_interest_rate = number.to_f / 100
  monthly_interest_rate = (annual_interest_rate / 12)

  prompt("Your monthly interest rate is #{monthly_interest_rate}.")

  monthly_interest_rate
end

def get_apr
  annual_interest_rate = ''

  loop do
    prompt("Enter annual percentage rate APR: (For example: 5.5 for 5.5%)")
    annual_interest_rate = Kernel.gets().chomp()

    break if check_number_validity(annual_interest_rate)
  end

  annual_to_monthly(annual_interest_rate)
end

def get_duration
  month_duration = ''

  loop do
    prompt("Enter in the duration of your loan in months:")
    month_duration = Kernel.gets().chomp()

    break if check_number_validity(month_duration)
  end

  month_duration.to_i()
end

def calculate_payment(amount, interest, duration)
  monthly_payment = amount.to_f * (interest / (1 - (1 + interest)**(-duration)))
  monthly_payment
end

def calculate_again
  answer = ''
  loop do
    prompt('Do you want to do another calculation? (y or n)')

    answer = Kernel.gets().chomp().downcase()

    if answer == "n" || answer == "y"
      break
    else
      prompt('Not a valid entry. Try again.')
    end
  end
  answer
end

# _____ END OF METHODS _____ #
clear_screen()

prompt("Welcome! I am the Mortgage Calculator.
\nI will calculate your monthly payments based on your:
   a) loan amount \n   b) APR percentage\n   c) loan duration")

loop do
  loan_amount = get_amount()

  monthly_interest = get_apr()

  duration = get_duration()

  result = calculate_payment(loan_amount, monthly_interest, duration).round(2)
  prompt("Your monthly payment is $#{result}.")

  again = calculate_again()
  break if again == 'n'
  clear_screen()
end

prompt("Thank you for using the Mortgage Calculator! Goodbye.")
