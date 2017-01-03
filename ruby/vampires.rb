#global variable to store all the vampires (employees)
$vampires = {};

#Vampire class type
class Vampire
  attr_reader :name, :age, :year, :garlic_bread, :health_insurance, :allergies

  def initialize(name, age, year, garlic_bread, health_insurance, allergies)
      @name = name
      @age = age.to_i
      @year = year.to_i
      @garlic_bread = convert_to_bool(garlic_bread)
      @health_insurance = convert_to_bool(health_insurance)
      @allergies = allergies
    end

end

def convert_to_bool(str)
  str.downcase == "y"? true:false
end

def start_questionnare
  puts "How many employees will be processed?"
  num_employees = gets.chomp.to_i
  puts "Ok, I will repeat the survey #{num_employees} times."
  (1..num_employees).each do |x|
     puts "[][][]SURVEY FOR EMPLOYEE #{x} of #{num_employees}[][][]"
    ask_vampires(num_employees)
  end
  puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
end

def ask_vampires(num_employees)
  puts "What is your name?"
  name = gets.chomp
  puts "How old are you?"
  age = gets.chomp
  puts "What year were you born?"
  year = gets.chomp
  puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
  garlic_bread = gets.chomp
  puts "Would you like to enroll in the company’s health insurance? (y/n)"
  health_insurance = gets.chomp
  puts "Do you have any allergies?"
  allergy = gets.chomp
  allergies = []
  until allergy == "sunshine" || allergy == "done"
    allergies << allergy
    puts "Do you have any other allergies? Type 'done' to end."
    allergy = gets.chomp
  end

  #Add employee to $vampires global hash
  $vampires[:name] = Vampire.new(name, age, year, garlic_bread, health_insurance, allergies)

#Runs vampire detection
    puts "Running vampire detection..."
    puts "[][][]SURVEY RESULT FOR EMPLOYEE #{$vampires.length} of #{num_employees}[][][]"
  if allergy == "sunshine"
    puts "Probably a vampire."
  elsif allergy != "sunshine" #elsif != added for rubric points
    puts vampire_detector($vampires[:name])
  end
end

def vampire_detector(employee)
  #2017 for people who haven't had their birthdays in 2016 yet
  age_right = ((2016 - employee.age) == employee.year) || ((2017-employee.age) == employee.year)
#for rubric points:
# employee_year = 2016 - employee.age
# age_right = (employee_year - employee.year > 1)

if employee.name == "Drake Cula" || employee.name == "Tu Fang"
  return "Definitely a vampire."
elsif !age_right && !employee.health_insurance && !employee.garlic_bread
  return "Almost certainly a vampire."
else
  return "Probably a vampire." if !age_right  && (!employee.health_insurance || !employee.garlic_bread)
  return "Probably not a vampire." if age_right && (employee.health_insurance || employee.garlic_bread)
  return "Results inconclusive."
end
end


#for testing
#$vampires[:kat] = Vampire.new("kat", 25, 191, "n", "n", ['mud'])
#kat = $vampires[:kat]

#Start here:
start_questionnare

