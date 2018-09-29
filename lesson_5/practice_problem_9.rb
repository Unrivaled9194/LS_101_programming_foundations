# practice_problem_9.rb

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted_arr = arr.map do |sub_array|
  sub_array.sort do |a, b|
    b <=> a
  end
end

p sorted_arr
