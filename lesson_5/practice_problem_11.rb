# practice_problem_11.rb

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arr = arr.map do |outer_arr|
  outer_arr.select do |inner_arr|
    inner_arr % 3 == 0
  end
end

p new_arr
