class Ant
  attr_accessor :ant_row, :ant_col, :ant_working, :ant_direction, :ant_steps
  def initialize(positionr, positionc, working)
    @ant_row = positionr
    @ant_col = positionc
    @ant_working = working
    @ant_direction = rand(0..3)
    @ant_steps = rand(1..10)
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
