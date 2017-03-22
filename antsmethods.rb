class AntsMethods
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

  def alive_ants(grid,maxr,maxc,aliveants)
    count = 0
    while (count != aliveants)
      key = rand(0...maxr) * maxr + rand(0...maxc)
      if grid[key] == "*" or grid[key] == "o"
        next
      else
        grid[key] = "o"
      end
      count += 1
    end
  end

  def populate_grid(grid,maxr,maxc,deadants,aliveants)
    # NOTE: ' ' for nothing
    # =>    'o' for alive ants
    # =>    '*' for dead ants
    dead_ants(grid,maxr,maxc,deadants)
    alive_ants(grid,maxr,maxc,aliveants)
  end

  def show_grid (grid,maxr,maxc)
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
    sleep(2)
  end
end
