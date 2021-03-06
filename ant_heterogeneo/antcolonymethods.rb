require_relative "ant.rb"
class AntColonyMethods
  def dead_ants(grid,infos)
    infos.each do |l|
        r = rand(0...grid.grid_maxr)
        c = rand(0...grid.grid_maxc)
        key = r * grid.grid_maxr + c
      if grid.grid_field[key] != " "
        next
      else
        l.info_row = r
        l.info_col = c
        grid.grid_field[key] = l
      end
    end
  end

  def alive_ants(grid,aliveants,ants)
    count = 0
    aliveants=5
    while (count != aliveants)
      r = rand(0...grid.grid_maxr)
      c = rand(0...grid.grid_maxc)
      key = r * grid.grid_maxr + c
      if grid.grid_field[key] != " "
        next
      else
        ants.push Ant.new(r,c,0)
      end
      count += 1
    end
  end

  def populate_grid(grid,infos,aliveants,ants)
    dead_ants(grid,infos)
    alive_ants(grid,aliveants,ants)
  end

  def show_grid (grid,count)
    # NOTE: Next line clear the ubuntu terminal and them wait X seconds
    system 'clear'
    # print grid.keys
    for r in 0...grid.grid_maxr do
      print "|"
      for c in 0...grid.grid_maxc do
        key = r * grid.grid_maxr + c
        if grid.grid_field[key] != " "
          print grid.grid_field[key].info_color
        else
          print " "
        end
        print "|"
        if c == grid.grid_maxc-1
          print "\n"
        end
      end
    end
    puts "|---> Max Length=#{grid.grid_maxc} |---> Max Height #{grid.grid_maxr}}"
    puts " Interaction: #{count+1}"
    sleep(0.1)
  end

  def walk_ants(ant,grid)
    # NOTE: 0 == N
    # =>    1 == E
    # =>    2 == S
    # =>    3 == W
    if ant.ant_steps != 0

      if ant.ant_direction == 0

        if ant.ant_row == 0
          ant.ant_direction = rand(0..3)
        else #its a valid position
            ant.ant_row -= 1
            ant.ant_steps -= 1
        end
      end

      if ant.ant_direction == 1

        if ant.ant_col == grid.grid_maxc - 1
          ant.ant_direction = rand(0..3)
        else #its a valid position
          ant.ant_col += 1
          ant.ant_steps -= 1
        end
      end

      if ant.ant_direction == 2

        if ant.ant_row == grid.grid_maxr - 1
          ant.ant_direction = rand(0..3)
        else #its a valid position
            ant.ant_row += 1
            ant.ant_steps -= 1
        end
      end

      if ant.ant_direction == 3

        if ant.ant_col == 0
          ant.ant_direction = rand(0..3)
        else #its a valid position
            ant.ant_col -= 1
            ant.ant_steps -= 1
        end
      end

    else
      ant.ant_direction = rand(0..3)
      ant.ant_steps = rand(1..10)
    end
  end

  def capture_ants(grid,lineofsight,ant,count,interactions)
    cell_count = 0.0
    dead_count = 0.0
    unless !ant.ant_info.nil?
      for r in 0..lineofsight*2 do
        for c in 0..lineofsight*2 do
          if r == lineofsight and c == lineofsight
            #NOTE: if its here, don't count the ant itself
            next
          end
          i = ant.ant_row + r - lineofsight
          j = ant.ant_col + c - lineofsight
          if (i >= 0 and j >= 0) and (i < grid.grid_maxr and j < grid.grid_maxc)
            cell_count += 1
            if grid.grid_field[i * grid.grid_maxr + j] != " "
              dead_count += 1 if grid.grid_field[i * grid.grid_maxr + j].info_color == grid.grid_field[ant.ant_row * grid.grid_maxr + ant.ant_col].info_color
            end
          end
        end
      end
      prob = rand(0.01...1.00)
      if prob > dead_count/cell_count
        grid.grid_field[ant.ant_row * grid.grid_maxr + ant.ant_col].info_busy = 1
        ant.ant_info = grid.grid_field[ant.ant_row * grid.grid_maxr + ant.ant_col]
        grid.grid_field[ant.ant_row * grid.grid_maxr + ant.ant_col] = " "
        # File.open('log.txt','a') do |s|
        #   s.puts "pegou"
        # end
      end
    end
  end

  def release_ants(grid,lineofsight,ant)
    cell_count = 0.0
    dead_count = 0.0
    for r in 0..lineofsight*2 do
      for c in 0..lineofsight*2 do
        if r == lineofsight and c == lineofsight
          #NOTE: if its here, don't count the ant itself
          next
        end
        i = ant.ant_row + r - lineofsight
        j = ant.ant_col + c - lineofsight
        if (i >= 0 and j >= 0) and (i < grid.grid_maxr and j < grid.grid_maxc)
          cell_count += 1
          # File.open('log.txt','a') do |s|
          #   s.puts "hi"
          # end
          if grid.grid_field[i * grid.grid_maxr + j] != " "
            dead_count += 1 if grid.grid_field[i * grid.grid_maxr + j].info_color == ant.ant_info.info_color

          end
        end
      end
    end
    prob = rand(0.01...1.00)
    if prob < dead_count/cell_count
      grid.grid_field[ant.ant_row * grid.grid_maxr + ant.ant_col] = ant.ant_info
      grid.grid_field[ant.ant_row * grid.grid_maxr + ant.ant_col].info_busy = 0
      # NOTE: for test purposes
      # File.open('log.txt','a') do |s|
      #   s.puts "largou"
      # end
    end
  end

end
