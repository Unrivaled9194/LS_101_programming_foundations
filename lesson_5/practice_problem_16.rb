# practice_problem_16.rb

HEX = ('a'..'z').to_a + ('0'..'9').to_a
PARAMETERS = [8, 4, 4, 4, 12]
def generate_uuid()
  uuid_array = []
  index = 0
  5.times do
    section = ''
    PARAMETERS[index].times do
      section << HEX.sample
    end
    uuid_array << section
    index += 1
  end
  uuid_array.join('-')
end

p generate_uuid
