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
    sleep(1)
  end

  def walk_ants(ant,maxr,maxc,grid)
    # NOTE: 0 == N
    # =>    1 == E
    # =>    2 == S
    # =>    3 == W
    if ant.ant_steps != 0

      if ant.ant_direction == 0

        if ant.ant_row * maxr + ant.ant_col - maxr < 0
          ant.ant_direction = rand(1..3)
          walk_ants(ant,maxr,maxc,grid)
        else
          if (grid[ant.ant_row * maxr + ant.ant_col - maxr] == "o") or (grid[ant.ant_row * maxr + ant.ant_col - maxr] == "@") or (grid[ant.ant_row * maxr + ant.ant_col - maxr] == "*" and ant.ant_working == 1)
            ant.ant_direction = rand(1..3)
            walk_ants(ant,maxr,maxc,grid)
          else #next pos is a valid position
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

      elsif ant.ant_direction == 2

      elsif ant.ant_direction == 3

      end
    else
      ant.ant_direction = rand(0..3)
      ant.ant_steps = rand(1..10)
      walk_ants(ant,maxr,maxc,grid)
    end
  end

  def capture_ants

  end


  def release_ants

  end

end
