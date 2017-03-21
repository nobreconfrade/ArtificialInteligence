require_relative "antsmethods.rb"

class Ants < AntsMethods

  maxlength = 30
  maxheight = 30
  methods = AntsMethods.new
  puts "|---> Max Length=#{maxlength} |---> Max Height #{maxheight}}"
  grid = methods.populate_grid(maxlength,maxheight)
  methods.show_grid(grid,maxlength,maxheight)

end
