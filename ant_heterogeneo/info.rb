class Info
  attr_accessor :info_value1, :info_value2, :info_color, :info_row, :info_col
# => TODO: think about the info class
  def initialize(value1, value2, color)
    @info_value1 = value1
    @info_value2 = value2
    @info_color = color.chomp("\n")
    @info_color = "%x" % @info_color
    @info_busy = 0
    @info_row = 0
    @info_col = 0
  end

  def to_s
    @str = "Value 1: "+@info_value1.to_s+""
    @str += "Value 2: "+@info_value2.to_s+""
    @str += "Color: "+@info_color.to_s+""
    @str += "Busy?: "+@info_busy.to_s+""
    @str += "---------------\n"
    @str
  end

end
