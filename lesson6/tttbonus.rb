require 'io/console'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
  puts ""
end

def continue?
  prompt "[ Press any key to continue ]"
  STDIN.getch
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, hsh)
  system 'clear'
  name = hsh.keys

  puts "    (1)   (2)   (3)"
  puts "        |     |"
  puts "     #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "        |     |"
  puts "   -----+-----+-----"
  puts "        |     |"
  puts "(4)  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  (6)"
  puts "        |     |"
  puts "   -----+-----+-----"
  puts "        |     |"
  puts "     #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "        |     |"
  puts "    (7)   (8)   (9)"
  puts ""
  puts "----[  S C O R E  ]-----"
  puts "      YOU (X) = #{hsh[name[1]]}"
  puts "      CPU (O) = #{hsh[name[0]]}"
  puts "          TIE = #{hsh[name[2]]}"
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
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  option = { offense: nil, defense: nil }
  square = offense_or_defense(brd, option)
  if empty_squares(brd).size == 9 # cpu starts the game with a diff move
    square = empty_squares(brd).sample
  elsif brd[5] == INITIAL_MARKER && square.nil?
    square = 5
  elsif square.nil?
    square = winning_move(brd)
  end
  brd[square] = COMPUTER_MARKER
end

def winning_move(brd)
  corner = [1, 3, 7, 9]
  square = corner.sample
  if empty_squares(brd).include?(square)
    square
  else
    empty_squares(brd).sample
  end
end

def offense_or_defense(brd, option)
  WINNING_LINES.each do |line|
    num = line.select { |square| brd[square] == INITIAL_MARKER }.pop
    if computer_offense(brd, line)
      option[:offense] = num
    elsif computer_defense(brd, line)
      option[:defense] = num
    end
  end
  return option[:offense] unless option[:offense].nil?
  return option[:defense] unless option[:defense].nil?
  nil
end

def computer_defense(brd, line)
  risk = line.any? { |num| brd[num].include?(INITIAL_MARKER) == true }
  if brd.values_at(*line).count(PLAYER_MARKER) == 2 && risk
    true
  end
end

def computer_offense(brd, line)
  risk = line.any? { |num| brd[num].include?(INITIAL_MARKER) == true }
  if brd.values_at(*line).count(COMPUTER_MARKER) == 2 && risk
    true
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

def display_rules
  puts <<-RULES
    -------------------------------------------------------
   |    * * You must win 5 ROUNDS to win the game * *      |
   |                                                       |
   |    => How to win a round:                             |
   |    First player to match 3 pieces in a vertical,      |
   |    horizontal, or diagonal pattern wins.              |
   |                                                       |
   |    => How to tie:                                     |
   |    Both players must fill the board with no winner.   |
   |                                                       |
   |    => How to lose: Computer matches 3 pieces first.   |
    -------------------------------------------------------
  RULES
  continue?
end

def select_player
  loop do
    prompt "Select who plays first: [me] [computer] [random]"
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

def play_again?
  answer = ''

  loop do
    prompt "Play again? ('y' or 'n')"
    answer = gets.chomp.downcase
    break if answer.start_with?('y') || answer.start_with?('n')
    prompt "Not a valid response, try again."
  end
  return false if answer == 'n'
end

# ---------------------MAIN-------------------------

loop do
  system 'clear'
  score = { 'Computer' => 0, 'Player' => 0, 'Tie' => 0 }

  prompt "Welcome to TicTacToe!"
  sleep(1)
  system 'clear'

  prompt "Would you like to read the rules? ('y' or 'n')"
  response = gets.chomp.downcase
  display_rules if response == 'y'
  system 'clear'
  current_player = select_player
  prompt "#{current_player.capitalize} goes first!"
  sleep(1.5)

  loop do
    board = initialize_board

    loop do
      display_board(board, score)
      player_places_piece!(board) if current_player == 'player'
      computer_places_piece!(board) if current_player == 'computer'
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, score)

    if someone_won?(board)
      prompt "!*!*!* #{detect_winner(board).upcase} wins the round *!*!*!"
      score[detect_winner(board)] += 1
    else
      prompt "It's a tie!"
      score['Tie'] += 1
    end

    if score['Computer'] == 5 || score['Player'] == 5
      system 'clear'
      display_board(board, score)
      prompt "!*!*!* #{detect_winner(board).upcase} WINS THE GAME *!*!*!"
      break
    end
    continue?
  end

  sleep(1)
  break if play_again? == false
end

prompt "Thanks for playing TicTacToe! Goodbye."
