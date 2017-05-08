class Astar
  def solver(initial_x,initial_y,array,final_x,final_y)
    @array = array
    @dist = Array.new(@array.length,Float::INFINITY)
    @dist[initial_x*42+initial_y] = 0
    @prev = []
    @pq = []
    @pq.push([initial_x,initial_y,0,0])
    @prev[initial_x*42+initial_y] = [-1,-1]
    @peso = 1

    help = 0
    x = final_x
    y = final_y
    visitednodes = []
    expnodes = []


    while @pq.any?
      @pq = @pq.sort_by {|key1,key2,key3,val| val }
      # if help < 10
      #   print "#{@pq}\n"
      #   puts "-----------------------------------"
      #   help += 1
      # end
      @e = @pq.shift

      if @e[0] == final_x and @e[1] == final_y
        # @dist[final_x*42+final_y] = @dist[final_x*42+final_y] - @array[final_x*42+final_y]
        while x != -1 and y != -1
          visitednodes << @prev[x*42+y]
          x = visitednodes.last[0]
          y = visitednodes.last[1]
        end
        # print visitednodes
        return @dist[final_x*42+final_y],visitednodes,expnodes
      end

      if @e[0] - 1 >= 0
        if @dist[(@e[0] - 1) * 42 + @e[1]] > @dist[@e[0] * 42 + @e[1]] + @array[(@e[0] - 1) * 42 + @e[1]]
          @dist[(@e[0] - 1) * 42 + @e[1]] = @dist[@e[0] * 42 + @e[1]] + @array[(@e[0] - 1) * 42 + @e[1]]
          @prev[(@e[0] - 1) * 42 + @e[1]] = [@e[0],@e[1]]
          @pq.push([@e[0] - 1, @e[1],@dist[(@e[0] - 1) * 42 + @e[1]],@dist[(@e[0] - 1) * 42 + @e[1]] + ((@e[0] - 1 - final_x).abs + (@e[1] - final_y).abs) * @peso])
          expnodes.push([@e[0] - 1, @e[1]])
        end
      end

      if @e[1] + 1 < 42
        if @dist[@e[0] * 42 + @e[1] + 1] > @dist[@e[0] * 42 + @e[1]] + @array[@e[0] * 42 + @e[1] + 1]
          @dist[@e[0] * 42 + @e[1] + 1] = @dist[@e[0] * 42 + @e[1]] + @array[@e[0] * 42 + @e[1] + 1]
          @prev[@e[0] * 42 + @e[1] + 1] = [@e[0],@e[1]]
          @pq.push([@e[0], @e[1] + 1,@dist[@e[0] * 42 + @e[1] + 1],@dist[(@e[0]) * 42 + @e[1] + 1] + ((@e[0] - final_x).abs + (@e[1] + 1 - final_y).abs) * @peso])
          expnodes.push([@e[0], @e[1] + 1])
        end
      end

      if @e[0] + 1 < 42
        ################## NOTE: HEAVY TEST ENV #############################
        ################## NOTE: fuck this part, cost me 3 hours #############################
        # print "dist:#{@dist[@e[0] + 1 * 42 + @e[1]]}\n"
        # print "new:#{@dist[@e[0] * 42 + @e[1]]}\n"
        # print "new:#{@e[0]} e #{@e[1]}\n"
        # if @e[0] == 1 and @e[1] == 1
        #   print "dist:#{@dist[@e[0] + 1 * 42 + @e[1]]}\n"
        #   print "atual:#{@dist[@e[0] * 42 + @e[1]]}\n"
        #   print "#{@e[0]} and #{@e[1]}\n"
        #   print "#{(@e[0]+1)*42+ @e[1]}\n"
        #   print "array:#{@array[@e[0] + 1 * 42 + @e[1]]}\n"
        #   print "array:#{@array[85]}\n"
        #   print "prev do dist:#{@prev[@e[0] + 1 * 42 + @e[1]]}\n"
        # end
        if @dist[(@e[0] + 1) * 42 + @e[1]] > @dist[@e[0] * 42 + @e[1]] + @array[(@e[0] + 1) * 42 + @e[1]]
          @dist[(@e[0] + 1) * 42 + @e[1]] = @dist[@e[0] * 42 + @e[1]] + @array[(@e[0] + 1) * 42 + @e[1]]
          @prev[(@e[0] + 1) * 42 + @e[1]] = [@e[0],@e[1]]
          @pq.push([@e[0] + 1, @e[1],@dist[(@e[0] + 1) * 42 + @e[1]],@dist[(@e[0] + 1) * 42 + @e[1]] + ((@e[0]+1 - final_x).abs + (@e[1] - final_y).abs) * @peso])
          expnodes.push([@e[0] + 1, @e[1]])
        end
      end

      if @e[1] - 1 >= 0
        if @dist[@e[0] * 42 + @e[1] - 1] > @dist[@e[0] * 42 + @e[1]] + @array[@e[0] * 42 + @e[1] - 1]
          @dist[@e[0] * 42 + @e[1] - 1] = @dist[@e[0] * 42 + @e[1]] + @array[@e[0] * 42 + @e[1] - 1]
          @prev[@e[0] * 42 + @e[1] - 1] = [@e[0],@e[1]]
          @pq.push([@e[0], @e[1] - 1,@dist[@e[0] * 42 + @e[1] - 1],@dist[@e[0] * 42 + @e[1] - 1] + ((@e[0] - final_x).abs + (@e[1] - 1 - final_y).abs) * @peso])
          expnodes.push([@e[0], @e[1] - 1])
        end
      end


    end
  end

end
