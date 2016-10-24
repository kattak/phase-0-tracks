module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yelling_happily
    return "yay!!"
  end

end

#Driver Code
#To run driver code, load file in irb after running require_relative 'shout'

#Yell angrily
Shout.yell_angrily("bah")

#Yell happily
Shout.yelling_happily

