# tictactoe.rb

require 'pry'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
PLAYS_FIRST = 'computer'

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(empty_squares, seperator = ',', joiner = 'or')
  joined_squares = ''
  empty_squares.each_with_index do |square, i|
    if empty_squares.size == 1
      joined_squares = square.to_s
    elsif i == empty_squares.size - 1
      joined_squares = joined_squares + joiner + ' ' + square.to_s
    else
      joined_squares += square.to_s + seperator + ' '
    end
    #binding.pry
  end
  joined_squares
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, score)
  system 'clear'
  puts "PLAYER = X    COMPUTER = O"
  puts ""
  puts "BEST OF 5"
  puts ""
  puts "TOTAL SCORE"
  puts "PLAYER #{score['Player']}   COMPUTER #{score['Computer']}"
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

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def initialize_score
  new_score = {}
  new_score['Player'] = 0
  new_score['Computer'] = 0
  new_score
end

def assign_score(contestant, score)
  score[contestant] += 1
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square " + joinor(empty_squares(brd))
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_defence_logic(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
       brd.values_at(*line).count(' ') == 1
      line.each { |square| return square if brd[square] == ' ' }
    end
  end
  nil
end

def computer_offence_logic(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2 &&
       brd.values_at(*line).count(' ') == 1
      line.each { |square| return square if brd[square] == ' ' }
    end
  end
  nil
end

def computer_places_piece!(brd)
  square = computer_offence_logic(brd)
  square = computer_defence_logic(brd) if !square
  square = 5 if brd[5] == ' ' && !square
  square = empty_squares(brd).sample if !square && square != 5
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def alternate_player(current_player)
  if current_player == 'player'
    current_player = 'computer'
  else
    current_player = 'player'
  end
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

score = initialize_score
current_player = ''
loop do
  board = initialize_board
  score = initialize_score if score.values.any? { |contestant| contestant > 4 }

  loop do
    if PLAYS_FIRST == 'choose'
      prompt "Who goes first this game? Player(p) or Computer(c)"
      choice = gets.chomp
      if choice == 'p'
        current_player = 'player'
        break
      elsif choice == 'c'
        current_player = 'computer'
        break
      else
        prompt "Invalid choice"
      end
    else
      current_player = PLAYS_FIRST
      break
    end
  end

  loop do
    display_board(board, score)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  assign_score(detect_winner(board), score) if detect_winner(board) != nil
  display_board(board, score)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won this round!"
    prompt "#{detect_winner(board)} won the game!!!" if score[detect_winner(board)] > 4
  else
    prompt "It's a tie!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
