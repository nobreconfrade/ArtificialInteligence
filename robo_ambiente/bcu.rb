class Bcu
  def initialize 
    @exparray = {}
    @distarray = Array.new(42**2,9999999)

  end
  def calc
    print @distarray
  end

  # def initialize(array)
  #   @array = array
  #   dist = Array.new(array.length,99999)
  #   prev = Array.new(array.length,-1)
  #   vcount = 0
  #   count = 0
  #   qarray = {}
  # end
  # # @array.each do |v|
  # #   vcount += 1
  # #   qarray << v
  # # end
  #
  # dist[0] = 0
  # qarray[0] = {0, dist[0]}
  # while prev[42*42] != -1 or !qarray.null?
  #   first = qarray[0]
  #   qarray.delete_if{i==0}
  #   count+=1
  #   if count < 42*42
  #     qarray << @array[count]
  #     qarray[count] = {}
  #     qarray << {first[0], dist[first] + @array[count] == 0 ? 1: @array[count] == 1? 5: @array[count] == 2? 10: 15
  #   end
  #   if count < 42*42
  #     qarray << @array[count+42]
  #     qarray << {count, dist[first] + @array[count] == 0 ? 1: @array[count] == 1? 5: @array[count] == 2? 10: 15
  #   end
  #   if count-1 >= 0
  #     qarray << @array[count-1]
  #     qarray << {count, dist[first] + @array[count] == 0 ? 1: @array[count] == 1? 5: @array[count] == 2? 10: 15
  #   end
  #   if count-42 >= 0
  #     qarray << @array[count-42]
  #     qarray << {count, dist[first] + @array[count] == 0 ? 1: @array[count] == 1? 5: @array[count] == 2? 10: 15
  #   end
  # end

end
