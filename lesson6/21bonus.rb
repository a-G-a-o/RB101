require 'io/console'

SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

POINTS_TO_BUST = 21
DEALER_STAY_LIMIT = 17

def initalize_deck
  SUITS.product(VALUES).shuffle
end

def prompt(msg)
  puts "==> #{msg}"
end

def display_text(msg)
  puts ""
  puts "> #{msg}"
  sleep(0.5)
end

def prompt_continue
  prompt "[ Press any key to continue ]"
  STDIN.getch
  system 'clear'
end

def prompt_next_round
  display_text "[ Press any key to START next round ]"
  STDIN.getch
end

def busted?(total)
  total > POINTS_TO_BUST
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

def display_deck(deck, name)
  display_text "PLAYER'S DECK:" if name == 'player'
  display_text "DEALER'S DECK:" if name == 'dealer'

  deck.each do |card|
    puts "   [#{card[1]} of #{symbol_to_word(card[0])}]"
  end

  puts "   --> Total is: #{total(deck)}"
  puts ""
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
  if player_total > POINTS_TO_BUST
    :player_busted
  elsif dealer_total > POINTS_TO_BUST
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
    display_text "You busted! Dealer wins!"
  when :dealer_busted
    display_text "Dealer busted! You win!"
  when :player
    display_text "Player wins!"
  when :dealer
    display_text "Dealer wins!"
  when :tie
    display_text "It's a tie!"
  end
end

def welcome_msg
  display_text "* * * * WELCOME TO THE GAME OF TWENTY-ONE * * * *"
  display_text "> > > >  WIN 5 TIMES TO BEAT THE GAME  < < < < <"
  sleep(1)

  loop do
    prompt "Would you like to read the rules? ('y' or 'n')"
    response = gets.chomp.downcase
    display_rules if response == 'y'
    break if ['y', 'yes', 'n', 'no'].include?(response)
    display_text "Sorry, invalid response. Try again."
  end
end

def display_rules
  puts <<-RULES
    ---------------------THE RULES-----------------------           
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
    display_text "Sorry, invalid response. Try again."
  end

  if answer.downcase.start_with?('y')
    system 'clear'
    display_text "Re-setting and re-shuffling decks..."
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
prompt_continue

loop do
  player_score = 0
  dealer_score = 0
  round_count = 0
  winner = ''

  loop do
    system 'clear'
    deck = initalize_deck
    player_deck = []
    dealer_deck = []

    round_count += 1
    display_text "-> ROUND #{round_count} <- <"
    display_score(player_score, dealer_score)
    prompt_continue

    display_text "Dealing cards..."
    2.times do
      player_deck << deck.pop
      dealer_deck << deck.pop
    end

    display_deck(player_deck, 'player')
    display_text "DEALER'S DECK:"
    puts "   [#{deck[0][1]} of #{symbol_to_word(deck[0][0])}]"
    puts "   [HIDDEN]"
    puts ""

    player_total = total(player_deck)
    dealer_total = total(dealer_deck)

    loop do # player's turn
      player_response = nil

      loop do
        prompt "Do you want to 'hit' or 'stay'?"
        player_response = gets.chomp.downcase
        break if ['hit', 'stay'].include?(player_response)
        display_text "Sorry, invalid response. Try again."
      end

      if player_response == 'hit'
        display_text "Player hits."
        player_deck << deck.pop
        display_deck(player_deck, 'player')
        player_total = total(player_deck)
      end

      if player_response == 'stay' || busted?(player_total)
        display_text "Player stays." if player_response == 'stay'
        break
      end
    end

    if busted?(player_total)
      display_text "Player busted! Player total is: #{player_total}"
      display_result(dealer_total, player_total)
      prompt_next_round
      dealer_score += 1
      break if player_score >= 5 || dealer_score >= 5
      next
    end

    prompt_continue
    display_text "Switching to dealer's hand..." # dealer's turn

    loop do
      break if dealer_total >= 17
      display_deck(dealer_deck, 'dealer')
      display_text "Dealer hits."
      sleep(0.5)
      dealer_deck << deck.pop
      dealer_total = total(dealer_deck)
    end

    display_deck(dealer_deck, 'dealer')

    if busted?(dealer_total)
      display_text "Dealer busted! Dealer total is: #{dealer_total}"
      player_score += 1
      prompt_next_round
      break if player_score >= 5 || dealer_score >= 5
      next
    else
      display_text "Dealer stays at #{dealer_total}"
      prompt_continue
    end

    system 'clear'
    display_text "Player and dealer both stay. Now comparing both decks..."
    sleep(0.5)
    display_deck(player_deck, 'player')
    display_deck(dealer_deck, 'dealer')

    winner = detect_winner(dealer_total, player_total)
    display_result(dealer_total, player_total) # compare totals
    prompt_next_round

    if winner == :dealer || winner == :player_busted
      dealer_score += 1
    elsif winner == :player || winner == :dealer_busted
      player_score += 1
    end

    break if player_score >= 5 || dealer_score >= 5
  end

  system 'clear'
  display_text "-> FINAL SCORE <- <"
  display_score(player_score, dealer_score)

  if winner == :dealer || winner == :player_busted
    display_text "DEALER wins 5 games!"
  elsif winner == :player || winner == :dealer_busted
    display_text "PLAYER wins 5 games!"
  end
  sleep(1)
  break unless play_again
end

display_text "Thanks for playing Twenty-One! Goodbye."
