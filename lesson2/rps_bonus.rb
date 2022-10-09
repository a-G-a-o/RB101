require 'yaml'

MESSAGE = YAML.load_file('rps_messages.yml')

CHOICES = {
  'rock' => { symbol: 'r', beats: %w(scissors lizard) },
  'paper' => { symbol: 'p', beats: %w(rock spock) },
  'scissors' => { symbol: 'sc', beats: %w(paper lizard) },
  'lizard' => { symbol: 'l', beats: %w(spock paper) },
  'spock' => { symbol: 'sp', beats: %w(scissors rock) }
}

puts CHOICES.inspect

NAMES = CHOICES.keys
PRINT_NAMES = NAMES.join(', ')
SYMBOLS = CHOICES.values.map { |hash| hash[:symbol] }
PRINT_SYMBOLS = SYMBOLS.join(', ')

ROUNDS_TO_WIN = 5

# ________________________ METHODS ________________________ #
def clear_screen
  Kernel.system('clear')
end

def pause(time = 3)
  sleep(time)
end

def messages(message)
  MESSAGE[message]
end

def prompt(message)
  Kernel.puts("==> #{message}")
end

def get_player_choice
  player_choice = get_input(
    "[YOUR TURN] #{PRINT_NAMES}?\n(Shortcuts: #{PRINT_SYMBOLS}"
  )

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
  choices = (SYMBOLS.include?(input) || NAMES.include?(input))
  if choices == false
    prompt(MESSAGE['error_message'])
  end

  choices
end

def sym_to_name(input)
  player_choice = ''

  case input
  when 'r' then player_choice = 'rock'
  when 'p' then player_choice = 'paper'
  when 'sc' then player_choice = 'scissors'
  when 'l' then player_choice = 'lizard'
  when 'sp' then player_choice = 'spock'
  else
    false
  end

  player_choice
end

def win?(first, second)
  CHOICES[first][:beats].include?(second)
end

def determine_winner(player, cpu)
  winner = ''

  if win?(player, cpu)
    winner = 'player'
  elsif win?(cpu, player)
    winner = 'cpu'
  else
    winner = 'tie'
  end

  winner
end

def print_result(result)
  if result == 'player'
    prompt(MESSAGE['win'])
  elsif result == 'cpu'
    prompt(MESSAGE['lose'])
  else
    prompt(MESSAGE['tie'])
  end
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

puts format(MESSAGE['greeting'], PRINT_NAMES: PRINT_NAMES)
prompt(MESSAGE['game_rules'])

loop do
  game_round = 0
  score = { player: 0, cpu: 0 }

  loop do
    game_round += 1
    puts format(MESSAGE['round_number'], game_round: game_round)

    player_choice = get_player_choice()
    cpu_choice = NAMES.sample

    if player_choice.length <= 2
      player_choice = symbol_to_name(player_choice)
    end

    prompt("[YOU CHOSE: #{player_choice} - SHELBOT CHOSE: #{cpu_choice}]")

    winner = determine_winner(player_choice, cpu_choice)
    update_score(winner, score)
    print_result(winner)

    prompt("[YOUR SCORE: #{score[:player]} - SHELBOT'S SCORE: #{score[:cpu]}]")

    display_grand_winner(score) if game_round == ROUNDS_TO_WIN
    break if game_round == ROUNDS_TO_WIN

    pause
    clear_screen()
  end

  again = play_again()
  break if again == 'n'
  clear_screen()
end

prompt(MESSAGE['goodbye_message'])
