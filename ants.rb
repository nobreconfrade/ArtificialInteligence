require_relative "antsmethods.rb"

class Ants < AntsMethods

  maxc = 30
  maxr = 30
  methods = AntsMethods.new
  puts "|---> Max Length=#{maxc} |---> Max Height #{maxr}}"
  grid = methods.populate_grid(maxc,maxr)
  methods.show_grid(grid,maxc,maxr)

end
