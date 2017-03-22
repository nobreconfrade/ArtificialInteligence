require_relative "antsmethods.rb"

class Ants < AntsMethods

  puts "Select the number of columns:"
  maxc = gets.to_i
  puts "Select the number of rows:"
  maxr = gets.to_i
  puts "Select the number of dead ants: (recommended: #{maxr*maxc/10})"
  deadants = gets.to_i
  puts "Select the number of ants alive: (recommended: #{maxr*maxc/100})"
  aliveants = gets.to_i
  grid = Hash.new(" ")
  methods = AntsMethods.new
  methods.populate_grid(grid,maxr,maxc,deadants,aliveants)
  methods.show_grid(grid,maxr,maxc)

end
