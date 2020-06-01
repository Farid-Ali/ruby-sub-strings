#Ask user for a string

puts "Type your search query"

#Get the string from form user
#Make the string case insensitive
#Store the string in a variable

user_input = gets.chomp.downcase

#Split the string and store it in a new array(This should create a substrings array with the user inputed string)

def user_inputed_sub_strings(user_input)
  0.upto(user_input.length - 1).flat_map do |start|
    1.upto(user_input.length - start).map do |length|
      user_input[start, length]
    end
  end
end

sub_strings = user_inputed_sub_strings(user_input)

#Create an array of substrings of your choice

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

#Compare user inputed substrings array with system created substrings array
#If any match found, push it to a new hash as a key and push how many times the substrings were found as a value

def compare_array(sub_strings, dictionary)
  sub_strings.reduce(Hash.new(0)) do |hash, word|
    dictionary.each do |dict_word|
      if word == dict_word
        hash[dict_word] += 1
      end
    end
    hash
  end
end

#Store the result in a variable

matched_value = compare_array(dictionary, sub_strings)

#Show the hash to the user

p matched_value





#Another method to achieve the same result
=begin
  def sub_strings(string, dictionary)
  string.downcase.split.reduce(Hash.new(0)) do |hash, word|
    dictionary.each do |dict_word| 
     if word.include?(dict_word)
      hash[dict_word] += 1
     end
    end
    hash
  end
end

# Test inputs from spec
dict = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
input_test = "Howdy partner, sit down! How's it going?"

# Will return true if my output matches spec output
p sub_strings(input_test, dict) == { "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 }
=end