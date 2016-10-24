#PSEUDOCODE:
# One user can enter a word (or phrase, if you would like your game to support that), and another user attempts to guess the word.
  #welcomes users
  #asks users to input names
  #asks user1 to input word
  #saves it in variable

# Guesses are limited, and the number of guesses available is related to the length of the word.
  #number of guesses == length of the word
# Repeated guesses do not count against the user.
  #store guesses made
  #check if new guess matches a guess already made
  #otherwise decrement guesses_counter by 1
# The guessing player receives continual feedback on the current state of the word. So if the secret word is "unicorn", the user will start out seeing something like "_ _ _ _ _ _ _", which would become "_ _ _ c _ _ _" after the user enters a guess of "c".
  #prints what word (in current state is each time)
# The user should get a congratulatory message if they win, and a taunting message if they lose.
  #prints these statements when guess_counter == 0

