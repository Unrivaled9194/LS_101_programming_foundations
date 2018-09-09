# rock_paper_scissor_spock_lizard.rb

VALID_CHOICES = { 'rock' => ['scissor', 'lizard'],
                  'paper' => ['rock', 'spock'],
                  'scissor' => ['paper', 'lizard'],
                  'spock' => ['scissor', 'rock'],
                  'lizard' => ['paper', 'spock'] }

def prompt(message)
  puts "\n=> #{message}"
end

def win?(first, second)
  VALID_CHOICES[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt "YOU WON!!"
  elsif win?(computer, player)
    prompt "Computer won"
  else
    prompt "It's a draw..."
  end
end

def display_total_score(player, computer)
  puts "\n------------SCORE------------"
  puts "PLAYER: #{player}         COMPUTER: #{computer}"
  if player == 5
    puts "\n*** YOU HAVE WON 5 MATCHES CONGRATULATIONS!!!!!! ***"
  elsif computer == 5
    puts "\n*** COMPUTER WON 5 MATCHES...YOU LOSE ***"
  end
end

player_score = 0
computer_score = 0

loop do
  choice = ''
  loop do
    system("clear")
    puts "-------ROCK PAPER SCISSOR SPOCK LIZARD-------"
    puts " \nRULES:"
    puts "* Scissor cuts Paper covers Rock crushes Lizard poisons *"
    puts "* Spock smashes Scissors decapitates Lizard eats Paper  *"
    puts "* disproves Spock vaporizes Rock crushes Scissors       *"
    puts "\n*** First to win 5 matches is victorious ***"
    prompt "Choose: 1 = Rock 2 = Paper 3 = Scissor 4 = Spock 5 = Lizard"
    choice = gets.chomp
    case choice
    when '1'
      choice = 'rock'
      break
    when '2'
      choice = 'paper'
      break
    when '3'
      choice = 'scissor'
      break
    when '4'
      choice = 'spock'
      break
    when '5'
      choice = 'lizard'
      break
    else
      prompt "That is not a valid choice"
    end
  end

  computer_choice = VALID_CHOICES.keys.sample

  prompt "You chose: #{choice}; Computer chose: #{computer_choice}"

  display_results(choice, computer_choice)

  player_score += 1 if win?(choice, computer_choice)
  computer_score += 1 if win?(computer_choice, choice)

  display_total_score(player_score, computer_score)

  if (player_score == 5) || (computer_score == 5)
    player_score = 0
    computer_score = 0
    prompt "Do you want to play another game to 5? (y/n)"
  else
    prompt "Do you want to play another round? (y/n)"
  end
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing!"
