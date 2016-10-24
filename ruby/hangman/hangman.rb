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

class Hangman
  attr_reader :player1, :player2, :secret_word, :guesses

  def initialize(player1, player2, word)
    @player1 = player1
    @player2 = player2
    @secret_word = word
    @guesses = 0
    @current_state = make_guess_array
  end

  def make_guess_array
    str = "_" * (@secret_word.length)
    return str.split("")
  end


  def check_guess(letter)
    #Do not penalize player for repeated guesses
    if !@current_state.include?(letter)
    if @secret_word.include?(letter) &&
      #update current_state
      @secret_word.split("").each_with_index{ |val, index|
        if val == letter
          @current_state[index] = val
        end
      }
      end

      #increment guess counter
      @guesses += 1
    end

    #return current state
    return @current_state
  end

  def over?
    return @guesses == @secret_word.length
  end

  def won?
    return @secret_word == @current_state.join("")
  end
end

#Driver Code
puts "Hello and welcome to Hangman"
puts "This game is for two players."
puts "Player 1, what is your name?"
player1 = gets.chomp
puts "Player2, what is your name?"
player2 = gets.chomp
puts "Ok, #{player1} will choose a word for #{player2} to guess"
puts "#{player1}, what word do you choose?"
secret_word = gets.chomp
guesses = secret_word.length
puts "#{player2} will have #{secret_word.length} guesses!"

#make new hangman instance
game = Hangman.new(player1, player2, secret_word)

while !game.over?
  puts ""
  puts "#{player2}, you have made #{game.guesses} out of #{game.secret_word.length} guesses"
  puts "#{player2}, guess a letter"
  letter = gets.chomp
  result = game.check_guess(letter)
  puts "Currently: #{result}"
end

if game.won?
  puts "Congratulations!"
  puts "#{game.player1} won in #{guesses} guesses!"
else
  puts "Haha"
  puts "#{game.player1} lost, even with #{guesses} guesses!"
end
