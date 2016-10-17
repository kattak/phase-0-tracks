# Psuedocode:
# -Ask all questions
# -Store questions in hash/array for easy access
# -Have a loop in which questions are asked
# -Break if user types exit
# -Tell user going to show them their answers
# -Show them answers
# -Ask if they want to change something
# -Show user keys they can type to change something
# -Prompt for new answer
# -Change answer
# -Break if user types none at any time


puts "Welcome to the INTERIOR DESIGNER JOB APPLICATION at xyz company"
puts "I will ask you a series of questions."
puts "Please type 'exit' at any time to exit the application."

questions = ["Name", "Address", "Email", "Phone", "Fave shade of blue"]
answers = {}

i = 0
loop do
  current_question = questions[i]
  puts questions[i]
  input = gets.chomp
  answers[current_question.to_sym] = input

  break if input == 'exit'
  break if i == questions.length-1
  i += 1
end
  puts "Wallpaper preferences"
  puts "Answer y/n for each, like ynyn"
  puts "Paisley, Chevrons, Photorealistic woodsy scenes (with or without squirrels), Abstract woodsy scenes (no squirrels)"
  input = gets.chomp
  break if input == 'exit'
  answers["Wallpaper preferences - Paisley, Chevrons, Photorealistic woodsy scenes (with or without squirrels), Abstract woodsy scenes (no squirrels)".to_sym] = input

  puts "Ombre is:"
  puts "Answer y/n for each, like yny"
  puts "Fierce, So last season, Practically medieval in its appalling irrelevance"
  input = gets.chomp
  break if input == 'exit'
  answers["Ombre is - Fierce, So last season, Practically medieval in its appalling irrelevance".to_sym] = input

  puts "Here are your answers:"
  puts answers
  puts "Do you want to change an answer?"
  puts "Please type 'none' at any time to exit this process."
  loop do
    puts "If you want to change your answer for any of the following, write their name:"
    puts answers.keys
    input = gets.chomp
    break if input == 'none'
    puts "The current answer is"
    puts answers[input.to_sym]
    puts "What do you want your new answer to be?"
    new_answer = gets.chomp
    break if new_answer == 'none'
    answers[input.to_sym] = new_answer
  end
  puts "Here are your answers:"
  puts answers
  puts "Thank you and good bye!"