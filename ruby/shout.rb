module Shout

  def yell_angrily(words) # use self.method when writing module as standalone module
    words + "!!!" + " :("
  end

  def yelling_happily #don't use self. when writing module as a mixin class
    "yay!!"
  end

end

class Ole_Yeller
  include Shout
end

class Yung_Yeller
  include Shout
end

#Driver Code
#To run driver code lines 20 - 26, load file in irb after running require_relative 'shout'

# #Yell angrily
# Shout.yell_angrily("bah")

# #Yell happily
# Shout.yelling_happily


######
grandpa = Ole_Yeller.new
grandpa.yell_angrily("bah")

grandson = Yung_Yeller.new
grandson.yelling_happily