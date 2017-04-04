require_relative "antcolonymethods.rb"
require_relative "ant.rb"
require_relative "grid.rb"
require_relative "info.rb"
# PRAISE THE SUN
#
# made by: William Pereira
class AntColony < AntColonyMethods

  methods = AntColonyMethods.new
  ants = Array.new
  infos = Array.new
  count = 0

  # NOTE: Fixed tests
  maxc = 40
  maxr = 40
  aliveants = 10
  interactions = 10000
  lineofsight = 1
  show = 0

  File.open('input.txt','r') do |f|
    f.each_line do |line|
      content  = line.split(/)
      infos.push Info.new(content[0],content[1],content[2])
    end
  end


  grid = Grid.new(maxr, maxc, interactions, aliveants})
  methods.populate_grid(grid,infos)

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
      # puts " Interaction: #{count}"
    end
    methods.show_grid(grid,maxr,maxc,count-1)
  end
end
