# calculator.rb

# ask the user for two numbers
# ask the user for the operation to perform
# perform the operation on the numbers
# output result

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  check = num.to_i
  num == check.to_s
end

def operation_to_message(op)
  operator = case op
    when '1'
      'Adding'
    when '2'
      'Subtracting'
    when '3'
      'Multiplying'
    when '4'
      'Dividing'
      return operator
    end
end

prompt("Welcome the the Calculator! Enter your name: ")

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt("Please enter a valid name")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  num1 = ''
  num2 = ''

  loop do
    prompt("What is the first number: ")
    num1 = gets.chomp
    if valid_number?(num1)
      break
    else
      prompt("Sorry that is not a valid number")
    end
  end

  loop do
    prompt("What is the second number: ")
    num2 = gets.chomp
    if valid_number?(num2)
      break
    else
      prompt("Sorry that is not a valid number")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)
  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             num1.to_i + num2.to_i
           when '2'
             num1.to_i - num2.to_i
           when '3'
             num1.to_i * num2.to_i
           when '4'
             if num2.to_f == 0
               "Error: Can't divide by zero"
             else
               num1.to_f / num2.to_f
             end
           end
  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator program :)")
