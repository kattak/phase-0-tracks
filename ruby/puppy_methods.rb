class Puppy

  def fetch(toy)
      puts "I brought back the #{toy}!"
      toy
  end

  def speak(number)
    puts "Woof! " * number #puts woof on same line
    #puts number.times{puts "woof"} (will put each on seperate lines)
  end

  def roll_over
    puts "Rolls over"
  end

  def dogs_age(human_age)
    doggie_age = human_age.to_i * 6
    puts doggie_age
  end

  def bad_dog(shoes)
    puts "I just ate #{shoes} pairs of your shoes!"
  end

  def initialize
    puts "Initializing new puppy instance..."
  end

end

fido = Puppy.new
spot = Puppy.new

fido.fetch("ball")
spot.speak(4)
fido.roll_over
spot.dogs_age(8)
fido.bad_dog(3)






class Kitty

  def initialize
    puts "Making new Kitty instance.."
  end

  def knock(your_stuff)
    puts "#{Kitty} knocked #{your_stuff} off the shelf"
  end

  def meow(number)
    number.to_i.times{puts "Meow "}
  end

  def nap(hours)
    hours.to_i
    puts "Leave me alone. I need to sleep another #{hours} hours."
  end

end

box_o_kitties = []


50.times{box_o_kitties << Kitty.new}

p box_o_kitties.length

box_o_kitties.each do |kitten|
  puts "Kitten num. #{box_o_kitties.index(kitten) + 1}"
  kitten.knock("priceless antique")
  kitten.meow("2")
  kitten.nap("16")
end



