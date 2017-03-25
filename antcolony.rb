require_relative "antcolonymethods.rb"
require_relative "ants.rb"
# PRAISE THE SUN
#
# made by: William Pereira
class AntColony < AntColonyMethods

  methods = AntColonyMethods.new
  grid = Hash.new(" ")
  count = 0

  puts "Select the number of columns:"
  maxc = gets.to_i
  puts "Select the number of rows:"
  maxr = gets.to_i
  puts "Select the number of dead ants: (recommended: #{maxr*maxc/10})"
  deadants = gets.to_i
  puts "Select the number of ants alive: (recommended: #{maxr*maxc/100})"
  aliveants = gets.to_i
  puts "An interaction is the full cycle of ants."
  puts "Chose the number of interactions you want:"
  interactions = gets.to_i
  methods.populate_grid(grid,maxr,maxc,deadants,aliveants)
  puts "Show all interactions? (y/n)"
  if gets == "y"
    while count != interactions
      ant = Ants().new
      methods.show_grid(grid,maxr,maxc)
      count += 1
    end
  else
    # NOTE: This environment show the inicial board and the result.
    methods.show_grid(grid,maxr,maxc)
    methods.show_grid(grid,maxr,maxc)
  end
end
