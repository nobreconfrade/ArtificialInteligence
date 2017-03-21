class AntsMethods
  def dead_ants(grid)

  end

  def live_ants(grid)

  end

  def populate_grid(maxlength,maxheight)
    # NOTE: '0' for nothing
    # =>    '1' for live ants
    # =>    '2' for dead ants
    grid = Hash.new(" ")
    grid = dead_ants(grid)
    grid = live_ants(grid)
    return grid
  end

  def show_grid (grid,maxlength,maxheight)
    # NOTE: Next line clear the ubuntu terminal and them wait X seconds
    system 'clear'
    sleep(5)
    for i in 0...maxlength do
      for j in 0...maxheight do
        print "|"
        print grid["#{i * maxlength + j}"]
        if j == maxlength-1
          puts ""
        end
      end
    end
  end
end
