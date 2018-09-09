# rock_paper_scissor.rb

VALID_CHOICES = %w(rock paper scissor)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissor') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissor' && second == 'paper')
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

loop do
  choice = ''
  loop do
    prompt("Choose: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "That is not a valid choice"
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt "You chose: #{choice}; Computer chose: #{computer_choice}"

  display_results(choice, computer_choice)

  prompt "Do you want to play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing!"
