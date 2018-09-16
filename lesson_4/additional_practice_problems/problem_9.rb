# problem_9.rb

words = "the flintstones rock"

words = words.split.map! do |word|
  word.capitalize
end

words = words.join(' ')
puts words
