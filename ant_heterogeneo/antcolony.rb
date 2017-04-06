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
  aliveants = 20
  interactions = 10000
  lineofsight = 1
  show = 0

  File.open('input2.txt','r') do |f|
    f.each_line do |line|
      content  = line.split("/")
      infos.push Info.new(content[0],content[1],content[2])
    end
  end


  grid = Grid.new(maxr, maxc, interactions, aliveants)
  methods.populate_grid(grid,infos,aliveants,ants)
  # FIXME: only testing first party
  methods.show_grid(grid,count)
  # infos.each do |g|
  #   print g.to_s
  # end

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
    methods.show_grid(grid,count)
    while count != interactions
      ants.each do |ant|
        # TODO: I expect this to work, if this doesn't work try making two 'if'.
        # => The first one check if is '!=' from " " and the sencond if is busy or not.
        if grid.grid_field[ant.ant_row * grid.grid_maxr + ant.ant_col] != " "
          if grid.grid_field[ant.ant_row * grid.grid_maxr + ant.ant_col].info_busy == 0
            methods.capture_ants(grid,lineofsight,ant,maxr,maxc)
            methods.walk_ants(ant,grid)
          else
            methods.release_ants(grid,lineofsight,ant,maxr,maxc)
            methods.walk_ants(ant,grid)
          end
        else
          methods.walk_ants(ant,grid)
        end
      end
      count += 1
      # puts " Interaction: #{count}"
    end
    methods.show_grid(grid,count-1)
  end
end
