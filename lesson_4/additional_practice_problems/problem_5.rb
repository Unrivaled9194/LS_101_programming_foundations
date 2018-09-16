# problem_5.rb

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.any? do |name|
  if name.start_with?("Be")
    p flintstones.index(name)
  end
end
