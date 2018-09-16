# problem_7.rb

statement = "The Flintstones Rock"
letter_hash = {}
statement.each_char do |letter|
  if letter != ' '
    letter_hash[letter] = statement.count(letter)
  end
end
p letter_hash
