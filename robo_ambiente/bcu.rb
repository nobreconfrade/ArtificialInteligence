class Bcu
  def solver(initial_x,initial_y,array,final_x,final_y)
    @array = array
    @dist = Array.new(@array.length,Float::INFINITY)
    @dist[initial_x*42+initial_y] = 0
    @prev = []
    @pq = []
    @pq.push([initial_x,initial_y,0])


    help = 0
    nc = 0
    ec = 0
    sc = 0
    wc = 0


    while @pq.any?
      @pq = @pq.sort_by {|key1,key2,val| val }
      if help < 5
        print "#{@pq}\n"
        puts "-----------------------------------"
        help += 1
      end
      @e = @pq.shift

      if @e[0] == final_x and @e[1] == final_y
        puts "HEY!"
        return 0,0,0
      end

      if @e[0] - 1 >= 0
        if @dist[@e[0] - 1 * 42 + @e[1]] > @dist[@e[0] * 42 + @e[1]] + @array[@e[0] - 1 * 42 + @e[1]]
          nc += 1
          @dist[@e[0] - 1 * 42 + @e[1]] = @dist[@e[0] * 42 + @e[1]] + @array[@e[0] - 1 * 42 + @e[1]]
          @prev[@e[0] - 1 * 42 + @e[1]] = [@e[0],@e[1]]
          @pq.push([@e[0] - 1, @e[1],@dist[@e[0] - 1 * 42 + @e[1]]])
        end
      end

      if @e[1] + 1 < 42
        if @dist[@e[0] * 42 + @e[1] + 1] > @dist[@e[0] * 42 + @e[1]] + @array[@e[0] * 42 + @e[1] + 1]
          ec += 1
          @dist[@e[0] * 42 + @e[1] + 1] = @dist[@e[0] * 42 + @e[1]] + @array[@e[0] * 42 + @e[1] + 1]
          @prev[@e[0] * 42 + @e[1] + 1] = [@e[0],@e[1]]
          @pq.push([@e[0], @e[1] + 1,@dist[@e[0] * 42 + @e[1] + 1]])
        end
      end

      if @e[0] + 1 < 42
        ################## NOTE: HEAVY TEST ENV #############################
        # print "dist:#{@dist[@e[0] + 1 * 42 + @e[1]]}\n"
        # print "new:#{@dist[@e[0] * 42 + @e[1]]}\n"
        # print "new:#{@e[0]} e #{@e[1]}\n"
        if @e[0] == 1 and @e[1] == 1
          print "dist:#{@dist[@e[0] + 1 * 42 + @e[1]]}\n"
          print "atual:#{@dist[@e[0] * 42 + @e[1]]}\n"
          print "array:#{@array[@e[0] + 1 * 42 + @e[1]]}\n"
          print "prev do dist:#{@prev[@e[0] + 1 * 42 + @e[1]]}\n"
        end
        if @dist[@e[0] + 1 * 42 + @e[1]] > @dist[@e[0] * 42 + @e[1]] + @array[@e[0] + 1 * 42 + @e[1]]
          sc += 1
          @dist[@e[0] + 1 * 42 + @e[1]] = @dist[@e[0] * 42 + @e[1]] + @array[@e[0] + 1 * 42 + @e[1]]
          @prev[@e[0] + 1 * 42 + @e[1]] = [@e[0],@e[1]]
          @pq.push([@e[0] + 1, @e[1],@dist[@e[0] + 1 * 42 + @e[1]]])
        end
      end

      if @e[1] - 1 >= 0
        if @dist[@e[0] * 42 + @e[1] - 1] > @dist[@e[0] * 42 + @e[1]] + @array[@e[0] * 42 + @e[1] - 1]
          wc += 1
          @dist[@e[0] * 42 + @e[1] - 1] = @dist[@e[0] * 42 + @e[1]] + @array[@e[0] * 42 + @e[1] - 1]
          @prev[@e[0] * 42 + @e[1] - 1] = [@e[0],@e[1]]
          @pq.push([@e[0], @e[1] - 1,@dist[@e[0] * 42 + @e[1] - 1]])
        end
      end

    end
    # puts "North counter: #{nc}"
    # puts "East counter: #{ec}"
    # puts "South counter: #{sc}"
    # puts "West counter: #{wc}"
    # print "#{@dist[1*42+1]}\n"
    # print "#{@dist[2*42+1]}\n"
  end

end
