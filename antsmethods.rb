class AntsMethods
  def populate_grid(maxlenght,maxheight)
    # NOTE: '0' for nothing
    # =>    '1' for live ants
    # =>    '2' for dead ants
    grid = Hash.new(" ")
    for i in 0..maxlenght
      for j in 0..maxheight
        # grid[i,j] = 0
      end
    end
    return grid
  end
  def show_grid (grid,maxlenght,maxheight)
    # NOTE: Next line clear the ubuntu terminal
    system 'clear'
    for i in 0...maxlenght do
      for j in 0...maxheight do
        print "|"
        print grid["#{i * maxlenght + j}"]
        if j == maxlenght-1
          puts ""
        end
      end
    end
  end
end
