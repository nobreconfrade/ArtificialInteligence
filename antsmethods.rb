class AntsMethods
  def dead_ants(grid,maxr,maxc)
    deadants = 0
    while (deadants != maxr*maxc/10)
      key = rand(0..maxr) * maxr + rand(0..maxc)
      if grid["#{key}"] == "2"
        next
      else
        grid = {"#{key}" => "2"}
        puts grid["#{key}"]
      end
      deadants += 1
    end
  end

  def live_ants(grid)

  end

  def populate_grid(maxr,maxc)
    # NOTE: ' ' for nothing
    # =>    '1' for live ants
    # =>    '2' for dead ants
    grid = Hash.new
    for r in 0..maxr do
      for c in 0..maxc do
        key = r * maxr + c
        grid = {"#{key}" => "0"}
        puts grid["#{key}"]
      end
    end
    show_grid(grid,maxr,maxc)
    grid = {"450" => "2"}
    show_grid(grid,maxr,maxc)
    grid = dead_ants(grid,maxr,maxc)
    # grid = live_ants(grid)
    return grid
  end
  # FIXME: what is the problem with this method? It doesn't print the grid, it even "forgets" the values
  def show_grid (grid,maxr,maxc)
    # NOTE: Next line clear the ubuntu terminal and them wait X seconds
    # system 'clear'
    print grid["1"]
    for r in 0...maxr do
      for c in 0...maxc do
        key = r * maxr + c
        print "|"
        print grid["#{key}"]
        if c == maxc-1
          puts ""
        end
      end
    end
    puts "|---> Max Length=#{maxc} |---> Max Height #{maxr}}"
    sleep(5)
  end
end
