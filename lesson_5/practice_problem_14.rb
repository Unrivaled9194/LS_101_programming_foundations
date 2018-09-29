# practice_problem_14.rb

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = []

hsh.map do |produce, info|
  if info[:type] == 'fruit'
    arr << info[:colors].collect { |word| word.capitalize }
  else
    arr << info[:size].upcase
  end
end

p arr
