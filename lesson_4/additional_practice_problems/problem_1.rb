# problem_1.rb

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = flintstones.each_with_object({}) do |name, hash|
  hash[name] = flintstones.index(name)
end

p flintstones_hash
