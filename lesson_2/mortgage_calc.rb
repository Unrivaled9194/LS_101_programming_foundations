# mortgage_calc.rb

# This is a mortgage calculator that will give the user their monthly
# payments based on loan amount, APR, and loan duration

def valid_number?(input)
  integer?(input) || float?(input)
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def message_format(messg)
  puts("#{messg}=>")
end

def monthly_payment(amount, rate, duration)
  amount = amount.to_f
  monthly_rate = (rate.to_f / 12) / 100
  duration_months = duration.to_i * 12
  amount * (monthly_rate / (1 - (1 + monthly_rate)**(-duration_months)))
end
puts "<<< MORTGAGE CALCULATOR >>>"
puts "\nThis program will calculate your monthly mortgage payment."
total_loan = ''
apr = ''
duration_years = ''

loop do
  puts "\nPlease provide the following information: "
  loop do
    message_format("Total loan amount")
    total_loan = gets.chomp
    if valid_number?(total_loan)
      break
    else
      puts "Please input a valid amount"
    end
  end
  loop do
    message_format("Annual Percentage Rate")
    apr = gets.chomp
    if valid_number?(apr)
      break
    else
      puts "Please enter a valid interest rate"
    end
  end
  loop do
    message_format("Length of loan (in years)")
    duration_years = gets.chomp
    if valid_number?(duration_years)
      break
    else
      puts "Please enter a valid duration in years"
    end
  end
  puts "\nYour monthly payment will be:"
  puts "$#{'%.2f' % monthly_payment(total_loan, apr, duration_years)}"
  puts "\nWould you like to perform another calculation?(y for yes)"
  answer = gets.chomp
  if answer.downcase != 'y'
    break
  end
end
puts "Thank you for using the Mortgage Calculator"
