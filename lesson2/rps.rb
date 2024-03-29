VALID_CHOICES = ['rock', 'paper', 'scissors']

# ________ START OF METHODS ________ #
def test_method
  prompt('test message')
end

test_method
def prompt(message)
  Kernel.puts("=> #{message}")
end

test_method

def display_results(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
    (player == 'paper' && computer == 'rock') ||
    (player == 'rock' && computer == 'paper')
    prompt("You won!")
  elsif (player == 'rock' && computer == 'paper') ||
    (player == 'paper' && computer == 'scissors') ||
    (player == 'scissors' && computer == 'rock')
    prompt("Computer won!")
  else 
    prompt("It's a tie!")
  end
end

# ________ END OF METHODS ________ #

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
    
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  
  computer_choice = VALID_CHOICES.sample
  
  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
  
  display_results(choice, computer_choice)
  
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")