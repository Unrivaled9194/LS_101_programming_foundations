# practice_problem_10.rb

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = arr.map do |hash|
    hash.transform_values do |integer|
    integer += 1
  end
end

p new_arr
p arr
