#This file was originally created July 2016

require 'catpix'

# require gems
require 'sqlite3'
#require 'faker'

# create SQLite3 database
db = SQLite3::Database.new("tasks.db")

#create table to store tasks
create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS tasks(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    time_to_complete INT,
    completed BOOLEAN
  )
SQL

#create table
db.execute(create_table_cmd)

#create task
def create_task(db, name, time_to_complete, completed)
  db.execute("INSERT INTO tasks (name, time_to_complete, completed) VALUES (?, ?)", [name, time_to_complete, completed])
end

class Bot
attr_reader :name, :play, :goals

def morning
  "Today is #{Time.now.asctime}".sys
  "Let's set some goals for today.".sys
  "What do you want to do today? ".sysp
  @goals = gets.chomp.split(',')
end

#features
#assign to category
#know if goal finished, congratulate me

#respond to queries:
#time log for today
#total time spent on ____
#unfinished goals
#how much more timer time
#breaks and logging breaks (pause/unpause commands?)
#how many days done _____

# def say(input)
#   str = "say "+ input
#   `#{str}`
# end


def book_animation
  Catpix.print_image("book.png")
  Catpix.print_image("book_0.png")
  Catpix.print_image("book_1.png")
  Catpix.print_image("book_2.png")
  Catpix.print_image("book_3.png")
#  Catpix.print_image("book.png")
end

def intro
  book_animation
  say('hi there')
   "Hi there.".sys
  say('What is your name?')
  print "What's your name? ".blue
  @name = gets.chomp
  `say "hi #{name}"`
  puts @name

  #create file
  File.open(name, 'a')

  morning

  self.play
end

  def play


    puts "What have you been up to?".blue
    activity = gets.chomp
  #  File.write(name, activity)
    File.open(name, 'a') { |file| file.write(activity + "\n") }
    puts "That's great! Thanks for telling me.".blue
    puts "What are you going to do now?".blue
    future_activity = gets.chomp
  #  File.write(name, future_activity)
     File.open(name, 'a') { |file| file.write(future_activity) }

#set time
    puts "Ok, I'll remind you when you're finished with taking a break.".blue
    puts "How long will it take you?".blue
    time = gets.chomp
    time = 10
    puts "Ok, I'll remind you in #{time} minutes".blue
    now = Time.now
    end_time = now + 1*60

    t = 10
    until Time.now >= end_time
      puts "You have #{t} minutes left.".blue if t > -1
      t -= 1
    end

    puts "#{time} minutes are up".blue

    puts "Did you do #{future_activity}?".blue
    answer = gets.chomp
    File.open(name, 'a') { |file| file.write(answer) }

    puts "Want to start a new loop?".blue
    ans = gets.chomp
    if ans == 'y'
      self.play
    else
      puts "Ok, let's talk soon. Bye bye.".blue
    end

  end
end


def say(input)
  str = "say -v Victoria "+ input
  `#{str}`
end

class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end

  def sys
    puts self.blue
  end

  def sysp
    print self.blue
  end


end

if __FILE__ == $PROGRAM_NAME

 Bot.new.intro
end
