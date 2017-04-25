class Bccu
  def initialize(array)
    @array = array
    dist = Array.new(array.length,99999)
    prev = Array.new(array.length,-1)
    vcount = 0
    qarray = {}
  end
  array.each do |v|
    vcount += 1
    qarray[vcount] = @array[vcount]
  end

  dist[0] = 0
  while !qarray.null?
    
  end

end
