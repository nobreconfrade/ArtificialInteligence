class Magic
  attr_accessor :pos_x, :pos_y, :prev
  def initialize(pos_x,pos_y,prev)
    @pos_x = pos_x
    @pos_y = pos_y
    @prev = prev
  end
  def to_s
    @end = "#{pos_x}\n"
    @end += "#{pos_y}\n"
    @end
  end
end
