require_relative "antsmethods.rb"

class Ants < AntsMethods

  maxc = 30
  maxr = 30
  methods = AntsMethods.new
  grid = methods.populate_grid(maxr,maxc)
  methods.show_grid(grid,maxr,maxc)

end
