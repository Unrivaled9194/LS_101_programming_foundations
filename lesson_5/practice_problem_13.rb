# practice_problem_13.rb

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

sorted_arr = arr.sort_by do |array|
  array.select do |num|
    num.odd?
  end
end

p sorted_arr
