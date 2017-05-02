require_relative 'magic.rb'
class Bfs
  def solver(pos_x,pos_y,array,final_x,final_y,initial_cost)
    @open = Array.new
    # @open.push(Magic.new(pos_x,pos_y,nil))
    @open.push([pos_x,pos_y,initial_cost,nil])
    @closed = Array.new
    @array = array
    @prevlist = Array.new
    # @prevlist.push(Magic.new(pos_x,pos_y,nil))
    @prevlist.push([pos_x,pos_y,initial_cost,nil])


    flag = 0
    count = 0
    while !@open.empty?
      @e = @open.first
      @open.delete_at(0)
      @closed.push(@e)
      # if @e.pos_x == final_x and @e.pos_y == final_y
      if @e[0] == final_x and @e[1] == final_y
        puts "HEY!"
        flag = 1
        break
      end
      # if @e.pos_x - 1 >= 0

#####################NOTE: TEST###########################
      if @e[0] - 1 >= 0
        @el = [@e[0] - 1,@e[1],@e[2]+@array[@e[0]*42+@e[1]],@e[3]]
        unless @closed.include?(@el) and @open.include?(@el)
          @open.push(@el)
          puts count
          count += 1
        end
      end
      if @e[1] + 1 < 42
        @el = [@e[0],@e[1] + 1, @e[2] + @array[@e[0]*42+@e[1]], @e[3]]
        unless @closed.include?(@el) and @open.include?(@el)
          @open.push(@el)
          puts count
          count += 1
        end
      end
      if @e[0] + 1 < 42
        @el = [@e[0] + 1,@e[1], @e[2] + @array[@e[0]*42+@e[1]], @e[3]]
        unless @closed.include?(@el) and @open.include?(@el)
          @open.push(@el)
          puts count
          count += 1
        end
      end
      if @e[1] - 1 >= 0
        @el = [@e[0],@e[1] - 1, @e[2] + @array[@e[0]*42+@e[1]], @e[3]]
        unless @closed.include?(@el) and @open.include?(@el)
          @open.push(@el)
          puts count
          count += 1
        end
      end


##########################################################
      # if @e.pos_x - 1 >= 0
      #   @el = Magic.new(@e.pos_x-1,@e.pos_y,@e)
      #   unless @closed.include?(@el) and @open.include?(@el)
      #     @open.push(@el)
      #   end
      # end
      # if @e.pos_y + 1 < 42
      #   @el = Magic.new(@e.pos_x,@e.pos_y+1,@e.pos_x*42+@e.pos_y)
      #   unless @closed.include?(@el) and @open.include?(@el)
      #     # puts "LISTEN!1"
      #     @open.push(@el)
      #   end
      # end
      # if @e.pos_x + 1 < 42
      #   @el = Magic.new(@e.pos_x+1,@e.pos_y,@e.pos_x*42+@e.pos_y)
      #   unless @closed.include?(@el) and @open.include?(@el)
      #     # puts "LISTEN!2"
      #     @open.push(@el)
      #   end
      # end
      # if @e.pos_y - 1 >= 0
      #   @el = Magic.new(@e.pos_x,@e.pos_y-1,@e.pos_x*42+@e.pos_y)
      #   unless @closed.include?(@el) and @open.include?(@el)
      #     # puts "LISTEN!3"
      #     @open.push(@el)
      #   end
      # end
    end
    if flag == 1
      # return @el.cost,@closed.length
      return @el[2],@closed.length
    end
    puts "Sem solução =/"
    puts "#{@closed}"
  end
end
