class Santa
  attr_reader :ethnicity, :reindeer_ranking #attr_reader gives read access
  attr_accessor :gender, :age                            #attr_accessor gives rw access

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}"
  end

  def celebrate_birthday
    @age += 1
    puts "Happy Birthday! Now #{@age} years old!"
  end

  def get_mad_at(reindeer_name)
    #first check if reindeer name valid
    if !@reindeer_ranking.include?(reindeer_name)
      puts "Sorry, you have entered a name for a reindeer that does not exist."
      puts "Your options are #{@reindeer_ranking.join(", ")}"
    else
      @reindeer_ranking.insert(@reindeer_ranking.length-1, @reindeer_ranking.delete_at(@reindeer_ranking.index(reindeer_name)))
  end
  puts "#{reindeer_name} is now the lowest-ranked reindeer"
  puts "Your reindeer ranking is now #{reindeer_ranking.join(", ")}"
end

  # replaced with attr_accessor :gender
  # def gender(input)
  #   @gender = input
  #   puts "Gender now changed to #{input}"
  # end

#replaced with attr_reader :age
# def age
#   return @age
# end

#replaced with attr_reader :ethnicity
# def ethnicity
#   return @ethnicity
# end

  def initialize(gender, ethnicity)
    puts "Initializing Santa instance ..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
    $SANTAS << self
  end
end

#Global array stores all instances of Santas
$SANTAS = []

#Driver Code

#Populate $SANTAS with num example Santa instances
def populate_santas(num)
  num.times do
    current_santa = example_santa
    current_santa.age = rand(140)
    puts "Santa added with the following attributes #{current_santa.inspect}"
  end
  puts "#{num} example Santas have been added to the $SANTAS array"
end

#Returns one example Santa
def example_santa
example_genders = ["nonbinary", "agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["Asian", "black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
    return Santa.new(example_genders.sample, example_ethnicities.sample)
end

#Initialize an example_santa instance
kat = example_santa #should be rewritten as a method inside Santa class??

#Check its in $SANTA array
puts $SANTAS

#eat_milk_and_cookies
kat.eat_milk_and_cookies("raisins")

#celebrate_birthday
kat.celebrate_birthday

#check age
kat.age

#check ethnicity
kat.ethnicity

#get_mad_at
kat.get_mad_at("Vixen")

#initalize 100 sample santas and add them to $SANTAS array
populate_santas(100)