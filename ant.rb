class Ant
  attr_accessor :ant_row, :ant_col, :ant_working
  # NOTE: '@@' means shared variable through objects
  @@ant_total = 0
  def initialize(positionr, positionc, working)
    @ant_row = positionr
    @ant_col = positionc
    @ant_working = working
    @@ant_total += 1
  end
  def to_s
    @str = "Row: "+@ant_row.to_s+"\n"
    @str += "Column: "+@ant_col.to_s+"\n"
    if @ant_working == 1
      @str += "Working? Yes\n"
    else
      @str += "Working? No\n"
    end
    @str += "Number of ant:"+@@ant_total.to_s+"\n"
    @str += "---------------\n"
    @str
  end
end
