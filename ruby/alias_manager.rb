#Psuedocode:
# Swapping the first and last name.
# Changing all of the vowels (a, e, i, o, or u) to the next vowel in 'aeiou', and all of the consonants (everything else besides the vowels) to the next consonant in the alphabet. So 'a' would become 'e', 'u' would become 'a', and 'd' would become 'f'.

#next_letter determines if vowel or consonant >> sends to next_consonant or next_vowel
#both methods have edge case for z


#Store names in hash
$names = Hash.new


def encrypt_name(str)
  encrypted_name = []
  two_names =  str.split(" ").reverse

  #for first string
  letters = two_names[0].split("")
  encrypted_name << letters.map{|letter| next_letter(letter.downcase)}.join().capitalize

  #for second string
  letters = two_names[1].split("")
  letters.map{|letter| next_letter(letter.downcase)}
  encrypted_name << letters.map{|letter| next_letter(letter)}.join().capitalize

  # store aliases in names hash
  $names[str] = encrypted_name.join(" ")

  #return encrypted name
  return encrypted_name.join(" ")
end

def next_letter(letter)
  #check if vowel or consonant
  vowels = ['a','e','i','o','u']
  if vowels.index(letter) != nil
    return next_vowel(letter)
  else
    return next_consonant(letter)
  end
end



def next_vowel(letter)
  vowels = ['a','e','i','o','u']
  if letter == 'u'
    return 'a'
  else
    return vowels[vowels.index(letter)+1]
  end
end

def next_consonant(letter)
  vowels = ['a','e','i','o','u']
  new_letter = letter.next

  #edge case for z
  if letter == 'z'
    return 'a'
  end

  if vowels.index(new_letter) != nil
    new_letter = new_letter.next  #checking once is sufficient because there are no consecutive vowels in the alphabet
  end
  return new_letter
end

#User Interface
puts "Please enter a name to encrypt."
puts "Type 'quit' at any time to quit."

loop do
  puts "Please enter a name to encrypt."
  input = gets.chomp
  break if input == "quit"
  puts "Your encrypted name is..."
  puts encrypt_name(input)
end

puts $names.keys.map{|real_name| "#{real_name.to_str} is known as #{$names[real_name]}"}
puts "Thank you and Good Bye!"
