# Pseudocode: loop through string - for/until/while?
# call .next on each letter
# make a new string??
# return that string

def encrypt(str)
  encrypted_str = ""
  i = 0
  while i < str.length
     letter = str[i]
    encrypted_letter = letter == "z"? "a": letter.next
    encrypted_str += encrypted_letter
    i += 1
  end
  return encrypted_str
end


def decrypt(str)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  decrypted_str = ""
  i = 0
  while i < str.length
    letter = str[i]
    alphabet_index = alphabet.index(letter)
    decrypted_letter = alphabet[alphabet_index - 1]
    decrypted_str += decrypted_letter
    i += 1
  end
  return decrypted_str
end