# problem_6.rb

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
  name.slice(0,3)
end

p flintstones
