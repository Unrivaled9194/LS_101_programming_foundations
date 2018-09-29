# practice_problem_15.rb

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_arr = arr.select do |element|
  element.all? do |_, value|
    value.all? do |integer|
      integer.even?
    end
  end
end

p new_arr
