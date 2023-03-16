WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

# sets each space to INITAL_MARKER, returns HASH
def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# checks for available spaces, RETURNS ARRAY
def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separator=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(separator)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (available squares: #{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

  if !square # offense
    computer_attack(brd, square, COMPUTER_MARKER)
  else
    computer_attack(brd, square, PLAYER_MARKER)
  end

  if brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  elsif !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def computer_attack(brd, square, marker)
  WINNING_LINES.each do |line| # defense
    square = find_at_risk_square(line, brd, marker)
    break if square
  end
end

# Computer defense
def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
  nil
end

def play_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def display_score(hsh)
  name = hsh.keys
  puts "---Score---"
  puts "#{name[0]}: #{hsh[name[0]]}"
  puts "#{name[1]}: #{hsh[name[1]]}"
  puts "#{name[2]}: #{hsh[name[2]]}"
  puts ""
end

def welcome_msg
  prompt "Welcome to TicTacToe!"
  sleep(1)
  system 'clear'
  prompt "Would you like to read the rules? ('y' or 'n')"
  response = gets.chomp.downcase
  display_rules if response == 'y'
end

def display_rules
  puts <<-RULES

    -----------------------------------------------------
   | Tictactoe is a turn based game.                     |
   | You must win 5 rounds to win the game.              |
   | Your board piece is 'X', Computer's piece is 'O'    |
   |                                                     |
   | => How to win a round:                              |
   |    First player to match 3 pieces in a vertical,    |
   |    horizontal, or diagonal pattern wins.            |
   | => How to tie:                                      |
   |    Both players must fill the board with no winner. |
   | => How to lose:                                     |
   |    Computer matches 3 pieces first.                 |
    -----------------------------------------------------

  RULES
end

def select_player
  loop do
    prompt "Select a player: [me] [computer] [random]"
    answer = gets.chomp.downcase

    case answer
    when 'me' then return 'player'
    when 'computer' then return 'computer'
    when 'random'
      prompt "Computer will select player..."
      sleep(1)
      computer_selection = ['player', 'computer'].sample
      return computer_selection
    else
      prompt "Invalid input. Try again!"
    end
  end
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
end

# -----main game sequence-----

loop do
  system 'clear'
  score = { 'Computer' => 0, 'Player' => 0, 'Tie' => 0 }

  welcome_msg
  prompt "Continue with the game? ('y' or 'n')"
  response = gets.chomp.downcase
  break if response == 'n'
  system 'clear'
  current_player = select_player
  prompt "#{current_player.capitalize} goes first!"
  sleep(1)

  loop do
    board = initialize_board

    loop do
      display_board(board)
      display_score(score)

      play_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      score[detect_winner(board)] += 1
    else
      prompt "It's a tie!"
      score['Tie'] += 1
    end

    sleep(1)
    break if score['Computer'] == 5 || score['Player'] == 5
  end

  prompt "Play again? ('y' or 'n')"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing TicTacToe! Goodbye."
