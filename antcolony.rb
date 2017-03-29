require_relative "antcolonymethods.rb"
require_relative "ant.rb"
# PRAISE THE SUN
#
# made by: William Pereira
class AntColony < AntColonyMethods

  methods = AntColonyMethods.new
  grid = Hash.new(" ")
  ants = Array.new
  count = 0

  # NOTE: Fixed tests
  maxc = 100
  maxr = 50
  deadants = 500
  aliveants = 50
  interactions = 50000
  lineofsight = 1
  show = 0

  #NOTE: Dinamic tests
  # puts "Select the number of columns:"
  # maxc = gets.to_i
  # puts "Select the number of rows:"
  # maxr = gets.to_i
  # puts "Select the number of dead ants: (recommended: #{maxr*maxc/10})"
  # deadants = gets.to_i
  # puts "Select the number of ants alive: (recommended: #{maxr*maxc/100})"
  # aliveants = gets.to_i
  # puts "An interaction is the full cycle of ants."
  # puts "Chose the number of interactions you want:"
  # interactions = gets.to_i
  # puts "The line of sight is the range that the ant can see and take an action over it."
  # puts "Chose a line of sight:"
  # lineofsight = gets.to_i
  # puts "Show all interactions? (1 or 0)"
  # show = gets.to_i

  methods.populate_grid(grid,maxr,maxc,deadants,aliveants,ants)
  if show == 1
    while count != interactions
      methods.show_grid(grid,maxr,maxc,count)
      #NOTE: logic of ants
      ants.each do |ant|
        if ant.ant_working == 1
          methods.release_ants(grid,lineofsight,ant,maxr,maxc)
          methods.walk_ants(ant,maxr,maxc,grid)
        else
          if grid[ant.ant_row * maxr + ant.ant_col] == "@"
            methods.capture_ants(grid,lineofsight,ant,maxr,maxc)
            methods.walk_ants(ant,maxr,maxc,grid)
          else
            methods.walk_ants(ant,maxr,maxc,grid)
          end
        end
      end
      count += 1
    end
  else
    # NOTE: This environment show the inicial board and the result.
    # NOTE: How to interact in the ants object.
    # ants.each do |ant|
    #   puts ant.to_s
    # end
    methods.show_grid(grid,maxr,maxc,count)
    while count != interactions
      ants.each do |ant|
        if ant.ant_working == 1
          methods.release_ants(grid,lineofsight,ant,maxr,maxc)
          methods.walk_ants(ant,maxr,maxc,grid)
        else
          if grid[ant.ant_row * maxr + ant.ant_col] == "@"
            methods.capture_ants(grid,lineofsight,ant,maxr,maxc)
            methods.walk_ants(ant,maxr,maxc,grid)
          else
            methods.walk_ants(ant,maxr,maxc,grid)
          end
        end
      end
      count += 1
      puts " Interaction: #{count}"
    end
    methods.show_grid(grid,maxr,maxc,count-1)
  end
end
