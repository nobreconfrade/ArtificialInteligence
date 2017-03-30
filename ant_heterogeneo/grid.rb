class Grid
  attr_accessor
  def initialize(maxr, maxc, interactions, info, ants)
    @grid_field = Hash.new(" ")
    @grid_maxr = maxr
    @grid_maxc = maxc
    @grid_interactions = interactions
    @grid_info = info
    @grid_ants = ants
  end

  def to_s
    @str = "Row: "+@ant_row.to_s+"\n"
    @str += "Column: "+@ant_col.to_s+"\n"
    if @ant_working == 1
      @str += "Working? Yes\n"
    else
      @str += "Working? No\n"
    end
    @str += "Direction:"+@ant_direction.to_s+"\n"
    @str += "Steps remaining:"+@ant_steps.to_s+"\n"
    @str += "---------------\n"
    @str
  end

end
