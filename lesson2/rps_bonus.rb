require 'yaml'

MESSAGE = YAML.load_file('rps_messages.yml')

VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'x' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

VALUES = VALID_CHOICES.values.join(', ')
KEYS = VALID_CHOICES.keys.join(', ')

WINNING_COMBO = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(spock paper),
  'spock' => %w(scissors rock)
}

ROUNDS_TO_WIN = 5

# ________________________ METHODS ________________________ #
def clear_screen
  Kernel.system('clear')
end

def messages(message)
  MESSAGE[message]
end

def prompt(message)
  Kernel.puts("==> #{message}")
end

def get_player_choice
  player_choice = get_input("[YOUR TURN] #{VALUES}?\n(Shortcuts: #{KEYS})")

  player_choice
end

def get_input(message)
  user_input = ''

  prompt(message)
  loop do
    user_input = Kernel.gets().chomp().downcase()
    break if check_input_validity(user_input)
  end

  user_input
end

def check_input_validity(input)
  if input == 'y' || input == 'n'
    true
  elsif input.match?(/\A[a-zA-Z'-]*\z/)
    if check_valid_choices(input)
      true
    end
  else
    false
  end
end

def check_valid_choices(input)
  choices = (VALID_CHOICES.value?(input) || VALID_CHOICES.key?(input))
  if choices == false
    prompt(MESSAGE['error_message'])
  end

  choices
end

def key_to_value(input)
  new_input = VALID_CHOICES.fetch(input)
  new_input
end

def display_results(player, cpu)
  winner = ''

  if WINNING_COMBO[player].include?(cpu)
    winner = 'player'
    prompt(MESSAGE['win'])
  elsif WINNING_COMBO[cpu].include?(player)
    winner = 'cpu'
    prompt(MESSAGE['lose'])
  else
    winner = 'tie'
    prompt(MESSAGE['tie'])
  end

  winner
end

def update_score(result, score)
  case result
  when 'player'
    score[:player] += 1
  when 'cpu'
    score[:cpu] += 1
  else
    true
  end
end

def display_grand_winner(score)
  prompt(MESSAGE['transition'])

  if score[:player] > score[:cpu]
    prompt(MESSAGE['win'])
  elsif score[:player] == score[:cpu]
    prompt(MESSAGE['tie'])
  else
    prompt(MESSAGE['lose'])
  end
end

def play_again
  answer = ''

  loop do
    answer = get_input(MESSAGE['play_again'])

    if answer == "n" || answer == "y"
      break
    else
      prompt(MESSAGE['error_message'])
    end
  end

  answer
end

# _________________________ MAIN _________________________ #
clear_screen()

puts format(MESSAGE['greeting'], VALUES: VALUES)
prompt(MESSAGE['game_rules'])

loop do
  game_round = 0
  score = { player: 0, cpu: 0 }

  loop do
    game_round += 1
    puts format(MESSAGE['round_number'], game_round: game_round)

    player_choice = get_player_choice()
    cpu_choice = VALID_CHOICES.values.sample

    if VALID_CHOICES.key?(player_choice)
      player_choice = key_to_value(player_choice)
    end

    prompt("[YOU CHOSE: #{player_choice} - SHELBOT CHOSE: #{cpu_choice}]")

    winner = display_results(player_choice, cpu_choice)
    update_score(winner, score)

    prompt("[YOUR SCORE: #{score[:player]} - SHELBOT'S SCORE: #{score[:cpu]}]")

    display_grand_winner(score) if game_round == ROUNDS_TO_WIN
    break if game_round == ROUNDS_TO_WIN
  end

  again = play_again()
  break if again == 'n'
  clear_screen()
end

prompt(MESSAGE['goodbye_message'])
