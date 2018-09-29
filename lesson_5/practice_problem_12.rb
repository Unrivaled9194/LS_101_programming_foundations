# practice_problem_12.rb
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

new_hash = arr.each_with_object({}) do |sub_array, pair|
  pair[sub_array[0]] = sub_array[1]
end

p new_hash
