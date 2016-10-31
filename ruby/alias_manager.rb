# Feedback from Bison:
# There are three best practices I want you to keep in mind when you write pseudocode.

#First, capitalize language-specific keywords (IF, ELSE, BREAK, etc).
#Second, write your pseudocode line-by-line as you would write your actual code. Just make sure it’s in plain English (no symbols, code-specific terminology).
#Finally, indent your pseudocode as you would your actual code. This means indenting code blocks, conditionals, and the like whenever written.

#[[EXAMPLE]]
# Pseudocode

# create method to swap vowels
# input: string
# steps:
  # create a cipher hash of vowels and their replacement
  # replace the character with its value pair in the cipher
# output: string

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

# def next_letter(letter) #OLD
#   #check if vowel or consonant
#   vowels = ['a','e','i','o','u']
#   if vowels.index(letter) != nil
#     return next_vowel(letter)
#   else
#     return next_consonant(letter)
#   end
# end

def next_letter(letter)
vowel_cipher = {'a' => 'e',  'e' => 'i', 'i' => 'o', 'o' => 'u', 'u' => 'a'}
consonant_cipher = {'d' => 'f', 'h' => 'j', "n" => 'p', 't' => 'v', 'z' => 'b'}

  #for vowels
  if vowel_cipher.has_key?(letter)
    return vowel_cipher[letter]
  elsif consonant_cipher.has_key?(letter)
    return consonant_cipher[letter]
  else
    return letter.next
  end
end


# In place of writing out the alphabet, consider using a cipher hash for vowels.
# vowel_cipher = {'a' => 'e',  'e' => 'i', 'i' => 'o', 'o' => 'u', 'u' => 'a'}
# From here, you can use the built-in has_key? method to test whether or not the letter is a vowel, and from there, use bracket notation to replace that vowel with the next in the sequence. If you need to, experiment with this in IRB to see how it works:

# def next_vowel(letter)
#    if cipher.has_key?(letter)
#       letter = cipher[letter]
#    end
# end

def next_vowel(letter)
  vowels = ['a','e','i','o','u']
  if letter == 'u'
    return 'a'
  else
    return vowels[vowels.index(letter)+1]
  end
end

#mistake 1: edgecase for 'z' returned 'a'
#mistake 2: can have edgecases just for d,h,n,t as they are the only ones followed by vowels
def next_consonant(letter)
  vowels = ['a','e','i','o','u']
  new_letter = letter.next

  #edge case for z -- old mistake: returned a, now returns b
  if letter == 'z'
    return 'b'
  end

  if vowels.index(new_letter) != nil
    new_letter = new_letter.next  #checking once is sufficient because there are no consecutive vowels in the alphabet
  end
  return new_letter
end

#Feedback: should rewrite all of this into a method
##Don't have logic, loops, etc. in global scope
##Have $names stores inside there, instead of as global variable

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
