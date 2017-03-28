require_relative "ant.rb"
class AntColonyMethods
  def dead_ants(grid,maxr,maxc,deadants)
    count = 0
    while (count != deadants)
      key = rand(0...maxr) * maxr + rand(0...maxc)
      if grid[key] == "*"
        next
      else
        grid[key] = "*"
      end
      count += 1
    end
  end

  def alive_ants(grid,maxr,maxc,aliveants,ants)
    count = 0
    while (count != aliveants)
      r = rand(0...maxr)
      c = rand(0...maxc)
      key = r * maxr + c
      if grid[key] == "*" or grid[key] == "o"
        next
      else
        grid[key] = "o"
        ants.push Ant.new(r,c,0)
      end
      count += 1
    end
  end

  def populate_grid(grid,maxr,maxc,deadants,aliveants,ants)
    # NOTE: ' ' for nothing
    # =>    'o' for alive ants
    # =>    '*' for dead ants
    dead_ants(grid,maxr,maxc,deadants)
    alive_ants(grid,maxr,maxc,aliveants,ants)
  end

  def show_grid (grid,maxr,maxc,count)
    # NOTE: Next line clear the ubuntu terminal and them wait X seconds
    system 'clear'
    # print grid.keys
    for r in 0...maxr do
      print "|"
      for c in 0...maxc do
        key = r * maxr + c
        print grid[key]
        print "|"
        if c == maxc-1
          print "\n"
        end
      end
    end
    puts "|---> Max Length=#{maxc} |---> Max Height #{maxr}}"
    puts " Interaction: #{count+1}"
    sleep(0.5)
  end

  def walk_ants(ant,maxr,maxc,grid)
    # NOTE: 0 == N
    # =>    1 == E
    # =>    2 == S
    # =>    3 == W
    if ant.ant_steps != 0

      if ant.ant_direction == 0

        if ant.ant_row == 0
          ant.ant_direction = rand(1..3)

        else #its a valid position
          if (grid[ant.ant_row * maxr + ant.ant_col - maxr] == "o") or (grid[ant.ant_row * maxr + ant.ant_col - maxr] == "@") or (grid[ant.ant_row * maxr + ant.ant_col - maxr] == "*" and ant.ant_working == 1)
            ant.ant_direction = rand(1..3)

          else #next pos has nothing wrong on it
            if grid[ant.ant_row * maxr + ant.ant_col] == "o"
              if grid[ant.ant_row * maxr + ant.ant_col - maxr] == " "
                grid[ant.ant_row * maxr + ant.ant_col - maxr] = "o"
                grid[ant.ant_row * maxr + ant.ant_col] = " "
              else # next pos == "*"
                grid[ant.ant_row * maxr + ant.ant_col - maxr] = "@"
                grid[ant.ant_row * maxr + ant.ant_col] = " "
              end
            else # ant over a dead ant
              if ant.ant_working == 1
                grid[ant.ant_row * maxr + ant.ant_col - maxr] = "@"
                grid[ant.ant_row * maxr + ant.ant_col] = " "
              else #not working
                if grid[ant.ant_row * maxr + ant.ant_col - maxr] == " "
                  grid[ant.ant_row * maxr + ant.ant_col - maxr] = "o"
                  grid[ant.ant_row * maxr + ant.ant_col] = "*"
                else #not working and next position is a "*"
                  grid[ant.ant_row * maxr + ant.ant_col - maxr] = "@"
                  grid[ant.ant_row * maxr + ant.ant_col] = "*"
                end
              end
            end
            ant.ant_row -= 1
            ant.ant_steps -= 1
          end
        end

      elsif ant.ant_direction == 1

        if ant.ant_col == maxc - 1
          ant.ant_direction = rand(0..3)

        else #its a valid position
          if (grid[ant.ant_row * maxr + ant.ant_col + 1] == "o") or (grid[ant.ant_row * maxr + ant.ant_col + 1] == "@") or (grid[ant.ant_row * maxr + ant.ant_col + 1] == "*" and ant.ant_working == 1)
            ant.ant_direction = rand(1..3)

          else #next pos has nothing wrong on it
            if grid[ant.ant_row * maxr + ant.ant_col] == "o"
              if grid[ant.ant_row * maxr + ant.ant_col + 1] == " "
                grid[ant.ant_row * maxr + ant.ant_col + 1] = "o"
                grid[ant.ant_row * maxr + ant.ant_col] = " "
              else # next pos == "*"
                grid[ant.ant_row * maxr + ant.ant_col + 1] = "@"
                grid[ant.ant_row * maxr + ant.ant_col] = " "
              end
            else # ant over a dead ant
              if ant.ant_working == 1
                grid[ant.ant_row * maxr + ant.ant_col + 1] = "@"
                grid[ant.ant_row * maxr + ant.ant_col] = " "
              else #not working
                if grid[ant.ant_row * maxr + ant.ant_col + 1] == " "
                  grid[ant.ant_row * maxr + ant.ant_col + 1] = "o"
                  grid[ant.ant_row * maxr + ant.ant_col] = "*"
                else #not working and next position is a "*"
                  grid[ant.ant_row * maxr + ant.ant_col + 1] = "@"
                  grid[ant.ant_row * maxr + ant.ant_col] = "*"
                end
              end
            end
            ant.ant_col += 1
            ant.ant_steps -= 1
          end
        end

      elsif ant.ant_direction == 2

        if ant.ant_row == maxr - 1
          ant.ant_direction = rand(1..3)

        else #its a valid position
          if (grid[ant.ant_row * maxr + ant.ant_col + maxr] == "o") or (grid[ant.ant_row * maxr + ant.ant_col + maxr] == "@") or (grid[ant.ant_row * maxr + ant.ant_col + maxr] == "*" and ant.ant_working == 1)
            ant.ant_direction = rand(1..3)

          else #next pos has nothing wrong on it
            if grid[ant.ant_row * maxr + ant.ant_col] == "o"
              if grid[ant.ant_row * maxr + ant.ant_col + maxr] == " "
                grid[ant.ant_row * maxr + ant.ant_col + maxr] = "o"
                grid[ant.ant_row * maxr + ant.ant_col] = " "
              else # next pos == "*"
                grid[ant.ant_row * maxr + ant.ant_col + maxr] = "@"
                grid[ant.ant_row * maxr + ant.ant_col] = " "
              end
            else # ant over a dead ant
              if ant.ant_working == 1
                grid[ant.ant_row * maxr + ant.ant_col + maxr] = "@"
                grid[ant.ant_row * maxr + ant.ant_col] = " "
              else #not working
                if grid[ant.ant_row * maxr + ant.ant_col + maxr] == " "
                  grid[ant.ant_row * maxr + ant.ant_col + maxr] = "o"
                  grid[ant.ant_row * maxr + ant.ant_col] = "*"
                else #not working and next position is a "*"
                  grid[ant.ant_row * maxr + ant.ant_col + maxr] = "@"
                  grid[ant.ant_row * maxr + ant.ant_col] = "*"
                end
              end
            end
            ant.ant_row += 1
            ant.ant_steps -= 1
          end
        end

      elsif ant.ant_direction == 3

        if ant.ant_col == 0
          ant.ant_direction = rand(0..2)
        else #its a valid position
          if (grid[ant.ant_row * maxr + ant.ant_col - 1] == "o") or (grid[ant.ant_row * maxr + ant.ant_col - 1] == "@") or (grid[ant.ant_row * maxr + ant.ant_col - 1] == "*" and ant.ant_working == 1)
            ant.ant_direction = rand(1..3)

          else #next pos has nothing wrong on it
            if grid[ant.ant_row * maxr + ant.ant_col] == "o"
              if grid[ant.ant_row * maxr + ant.ant_col - 1] == " "
                grid[ant.ant_row * maxr + ant.ant_col - 1] = "o"
                grid[ant.ant_row * maxr + ant.ant_col] = " "
              else # next pos == "*"
                grid[ant.ant_row * maxr + ant.ant_col - 1] = "@"
                grid[ant.ant_row * maxr + ant.ant_col] = " "
              end
            else # ant over a dead ant
              if ant.ant_working == 1
                grid[ant.ant_row * maxr + ant.ant_col - 1] = "@"
                grid[ant.ant_row * maxr + ant.ant_col] = " "
              else #not working
                if grid[ant.ant_row * maxr + ant.ant_col - 1] == " "
                  grid[ant.ant_row * maxr + ant.ant_col - 1] = "o"
                  grid[ant.ant_row * maxr + ant.ant_col] = "*"
                else #not working and next position is a "*"
                  grid[ant.ant_row * maxr + ant.ant_col - 1] = "@"
                  grid[ant.ant_row * maxr + ant.ant_col] = "*"
                end
              end
            end
            ant.ant_col -= 1
            ant.ant_steps -= 1
          end
        end

      end
    else
      ant.ant_direction = rand(0..3)
      ant.ant_steps = rand(1..10)
    end
  end

  def capture_ants(grid,lineofsight,ant,maxr,maxc)
    cell_count = 0
    dead_count = 0
    for r in 0..lineofsight*2 do
      for c in 0..lineofsight*2 do
        if r == lineofsight and c == lineofsight
          #NOTE: if its here, don't count the ant itself
          next
        end
        i = ant.ant_row + r - lineofsight
        j = ant.ant_col + c - lineofsight
        if (i >= 0 and j >= 0) and (i < maxr and j < maxc)
          cell_count += 1
          if grid[i * maxr + j] == "*" or grid[i * maxr + j] == "@"
            dead_count += 1
          end
        end
      end
    end
    prob = rand(0.01...1.00)
    if prob > dead_count/cell_count
      ant.ant_working = 1
    end
  end

  def release_ants(grid,lineofsight,ant,maxr,maxc)
    cell_count = 0
    dead_count = 0
    for r in 0..lineofsight*2 do
      for c in 0..lineofsight*2 do
        if r == lineofsight and c == lineofsight
          #NOTE: if its here, don't count the ant itself
          next
        end
        i = ant.ant_row + r - lineofsight
        j = ant.ant_col + c - lineofsight
        if (i >= 0 and j >= 0) and (i < maxr and j < maxc)
          cell_count += 1
          if grid[i * maxr + j] == "*" or grid[i * maxr + j] == "@"
            dead_count += 1
          end
        end
      end
    end
    prob = rand(0.01...1.00)
    if prob-0.2 < dead_count/cell_count
      ant.ant_working = 0
      # NOTE: for test purposes
      File.open('log.txt','a') do |s|
        s.puts "largou"
      end
    end
  end

end
