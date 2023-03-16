require 'pry'
require 'io/console'

# initalize deck
MAIN_DECK = [['H', '2'], ['S', '2'], ['C', '2'], ['D', '2'],
             ['H', '3'], ['S', '3'], ['C', '3'], ['D', '3'],
             ['H', '4'], ['S', '4'], ['C', '4'], ['D', '4'],
             ['H', '5'], ['S', '5'], ['C', '5'], ['D', '5'],
             ['H', '6'], ['S', '6'], ['C', '6'], ['D', '6'],
             ['H', '7'], ['S', '7'], ['C', '7'], ['D', '7'],
             ['H', '8'], ['S', '8'], ['C', '8'], ['D', '8'],
             ['H', '9'], ['S', '9'], ['C', '9'], ['D', '9'],
             ['H', '10'], ['S', '10'], ['C', '10'], ['D', '10'],
             ['H', 'J'], ['S', 'J'], ['C', 'J'], ['D', 'J'],
             ['H', 'Q'], ['S', 'Q'], ['C', 'Q'], ['D', 'Q'],
             ['H', 'K'], ['S', 'K'], ['C', 'K'], ['D', 'K'],
             ['H', 'A'], ['S', 'A'], ['C', 'A'], ['D', 'A']]

WHATEVER_ONE = 21
WHATEVER_ONE_DEALER = 17

def prompt(msg) # prompt user
  puts "==> #{msg}"
end

def cprompt(msg) # display text
  puts "> #{msg}"
  puts ""
  sleep(1)
end

def continue?
  prompt "[ Press any key to continue ]"
  STDIN.getch
  system 'clear'
end

def next_round?
  cprompt "[ Press any key to START next round ]"
  STDIN.getch
end

def busted?(total)
  total > WHATEVER_ONE
end

def symbol_to_word(card)
  symbol = card[0]

  case symbol
  when 'H' then symbol = 'Hearts'
  when 'S' then symbol = 'Spades'
  when 'C' then symbol = 'Clubs'
  when 'D' then symbol = 'Diamonds'
  end
  symbol
end

def display_deck(deck, name, reveal=false)
  cprompt "#{name.upcase}'S HAND:"

  if name == 'player' || (name == 'dealer' && reveal == true)
    deck.each do |card|
      puts "   [#{card[1]} of #{symbol_to_word(card[0])}]"
    end
    puts "   --> Total is: #{total(deck)}"
    puts ""
  elsif name == 'dealer' && reveal == false
    puts "   [#{deck[0][1]} of #{symbol_to_word(deck[0][0])}]"
    puts "   [HIDDEN]"
    puts ""
  end
end

def total(deck)
  sum = 0

  deck.each do |card|
    num = string_to_int(card[1], sum)
    sum += num
  end
  sum
end

def string_to_int(str, sum)
  num = 0

  case str
  when '1'..'10' then num = str.to_i
  when 'K', 'Q', 'J' then num = 10
  when 'A'
    num = 11 if sum <= 10
    num = 1 if sum > 10
  else num = 0
  end
  num
end

def detect_winner(dealer_total, player_total)
  if player_total > WHATEVER_ONE
    :player_busted
  elsif dealer_total > WHATEVER_ONE
    :dealer_busted
  elsif dealer_total > player_total
    :dealer
  elsif dealer_total < player_total
    :player
  else
    :tie
  end
end

def display_result(dealer_total, player_total)
  result = detect_winner(dealer_total, player_total)

  case result
  when :player_busted
    cprompt "You busted! Dealer wins!"
  when :dealer_busted
    cprompt "Dealer busted! You win!"
  when :player
    cprompt "Player wins!"
  when :dealer
    cprompt "Dealer wins!"
  when :tie
    cprompt "It's a tie!"
  end

  result
end

def welcome_msg
  cprompt "* * * * WELCOME TO THE GAME OF TWENTY-ONE * * * *"
  sleep(1)
  loop do
    prompt "Would you like to read the rules? ('y' or 'n')"
    response = gets.chomp.downcase
    display_rules if response == 'y'
    break if ['y', 'yes', 'n', 'no'].include?(response)
    cprompt "Sorry, invalid response. Try again."
  end
end

def display_rules
  puts <<-RULES

    -----------------------------------------------------
   | * * * *  WELCOME TO THE GAME OF TWENTY-ONE  * * * * |
   |                 ...THE RULES ARE...                 |             
   |                                                     |
   |   Number cards are scored at face value:            |
   |       [2] - TWO POINTS        [7] - SEVEN POINTS    |
   |       [3] - THREE POINTS      [8] - EIGHT POINTS    |
   |       [4] - FOUR POINTS       [9] - NINE POINTS     |
   |       [5] - FIVE POINTS       [10] - TEN POINTS     |
   |       [6] - SIX POINTS                              |
   |   Face cards are scored at:                         |
   |       [JACK] - TEN POINTS                           |
   |       [QUEEN] - TEN POINTS                          |
   |       [KING] - TEN POINTS                           |
   |   [ACE] is scored at:                               |
   |       ONE POINT or ELEVEN POINTS                    |
   |                                                     |
   |   - Each player is dealt 2 cards to start.          |
   |   - Player can choose to [STAY] or [HIT].           |
   |   - If either PLAYER or DEALER's hand exceeds 21,   |
   |     opponent wins.                                  |
   |   - When both PLAYER and DEALER choose [STAY],      |
   |     both hand's are compared.                       |
   |   --> THE DECK WITH THE GREATER TOTAL WINS! <--     |
    -----------------------------------------------------

  RULES
end

def play_again
  answer = ''

  loop do
    prompt "Do you want to play again? ('y' or 'n')"
    answer = gets.chomp.downcase
    break if ['y', 'n', 'yes', 'no'].include?(answer)
    cprompt "Sorry, invalid response. Try again."
  end

  if answer.downcase.start_with?('y')
    system 'clear'
    cprompt "Re-setting and re-shuffling decks..."
    true
  else
    false
  end
end

def display_score(player_score, dealer_score)
  puts "  PLAYER WINS: #{player_score}"
  puts "  DEALER WINS: #{dealer_score}"
  puts ""
end

# --------------------------MAIN-------------------------------

system 'clear'
welcome_msg
continue?

loop do
  player_score = 0
  dealer_score = 0
  round_count = 0
  winner = ''

  loop do
    system 'clear'
    deck = MAIN_DECK.shuffle
    player_deck = []
    dealer_deck = []

    round_count += 1
    cprompt "-> ROUND #{round_count} <- <"
    display_score(player_score, dealer_score)
    continue?

    cprompt "Dealing cards..."
    2.times do
      player_deck << deck.pop
      dealer_deck << deck.pop
    end

    display_deck(player_deck, 'player')
    display_deck(dealer_deck, 'dealer')
    player_total = total(player_deck)
    dealer_total = total(dealer_deck)

    loop do # player's turn
      player_response = nil

      loop do
        prompt "Do you want to 'hit' or 'stay'?"
        player_response = gets.chomp
        break if ['hit', 'stay'].include?(player_response)
        cprompt "Sorry, invalid response. Try again."
      end

      if player_response == 'hit'
        cprompt "Player hits."
        player_deck << deck.pop
        display_deck(player_deck, 'player')
        player_total = total(player_deck)
      end

      if player_response == 'stay' || busted?(player_total)
        cprompt "Player stays." if player_response == 'stay'
        break
      end
    end

    if busted?(player_total)
      cprompt "Player busted!"
      cprompt "Player total is: #{player_total}"
      display_result(dealer_total, player_total)
      continue?
      dealer_score += 1
      break if player_score >= 5 || dealer_score >= 5
      next
    end

    continue?
    cprompt "Switching to dealer's hand..." # dealer's turn

    loop do
      break if dealer_total >= 17
      display_deck(dealer_deck, 'dealer', true)
      cprompt "Dealer hits."
      dealer_deck << deck.pop
      dealer_total = total(dealer_deck)
      sleep(1)
    end

    display_deck(dealer_deck, 'dealer', true)
    if busted?(dealer_total)
      cprompt "Dealer busted! Dealer total is: #{dealer_total}"
      player_score += 1
      continue?
      break if player_score >= 5 || dealer_score >= 5
      next
    else
      cprompt "Dealer stays at #{dealer_total}"
      continue?
    end

    # compare player and dealer totals
    system 'clear'
    display_deck(player_deck, 'player')
    display_deck(dealer_deck, 'dealer', true)
    winner = display_result(dealer_total, player_total)
    continue?

    if winner == :dealer || winner == :player_busted
      dealer_score += 1
    elsif winner == :player || winner == :dealer_busted
      player_score += 1
    end

    break if player_score >= 5 || dealer_score >= 5
  end

  system 'clear'
  cprompt "-> FINAL SCORE <- <"
  display_score(player_score, dealer_score)

  if winner == :dealer || winner == :player_busted
    cprompt "DEALER wins 5 games!"
  elsif winner == :player || winner == :dealer_busted
    cprompt "PLAYER wins 5 games!"
  end
  sleep(1)
  break unless play_again
end

cprompt "Thanks for playing Twenty-One! Goodbye."
