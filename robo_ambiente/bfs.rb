require_relative 'magic.rb'
class Bfs
  def solver(pos_x,pos_y,array,final_x,final_y,initial_cost)
    @open = Array.new
    # @open.push(Magic.new(pos_x,pos_y,nil))
    @open.push([pos_x,pos_y,nil,nil])
    @closed = Array.new
    @array = array
    @prevlist = Array.new
    # @prevlist.push(Magic.new(pos_x,pos_y,nil))
    @prevlist.push([pos_x,pos_y,nil,nil])

    count = 0
    @finalarray = []

    while !@open.empty?
      @e = @open.first
      @closed.push(@e)
      @open.delete_at(0)
      # if @e.pos_x == final_x and @e.pos_y == final_y
      # if @e.pos_x - 1 >= 0

#####################NOTE: TEST###########################
      if @e[0] - 1 >= 0
        @el = [@e[0] - 1,@e[1],@e[0],@e[1]]
        unless @closed.include?(@el) and @open.include?(@el)
          @open.push(@el)
          @prevlist.push(@el)
          if @el[0] == final_x and @el[1] == final_y
            @prevlist.reverse_each do |c|
              puts "LISTEN!1"
              if c[0] == prev_x and c[1] == prev_y
                count += array[c[0]*42+c[1]]
                prev_x = c[2]
                prev_y = c[3]
                @finalarray.push([c[0],c[1]])
              end
            end
            puts @finalarray
            return count,@finalarray,@closed
          end
        end
      end
      if @e[1] + 1 < 42
        @el = [@e[0],@e[1] + 1, @e[0], @e[1]]
        unless @closed.include?(@el) and @open.include?(@el)
          @open.push(@el)
          @prevlist.push(@el)
          if @el[0] == final_x and @el[1] == final_y
            @prevlist.reverse_each do |c|
              puts "LISTEN!2"
              if c[0] == prev_x and c[1] == prev_y
                count += array[c[0]*42+c[1]]
                prev_x = c[2]
                prev_y = c[3]
                @finalarray.push([c[0],c[1]])
              end
            end
            puts @finalarray
            return count,@finalarray,@closed
          end
        end
      end
      if @e[0] + 1 < 42
        @el = [@e[0] + 1,@e[1], @e[0], @e[1]]
        unless @closed.include?(@el) and @open.include?(@el)
          @open.push(@el)
          @prevlist.push(@el)
          if @el[0] == final_x and @el[1] == final_y
            prev_x = @el[2]
            prev_y = @el[3]
            @prevlist.reverse_each do |c|
              # puts "LISTEN!3"
              if c[0] == prev_x and c[1] == prev_y
                count += array[c[0]*42+c[1]]
                prev_x = c[2]
                prev_y = c[3]
                @finalarray.push([c[0],c[1]])
              end
            end
            # print @finalarray
            return count,@finalarray,@closed
          end
        end
      end
      if @e[1] - 1 >= 0
        @el = [@e[0],@e[1] - 1, @e[0], @e[1]]
        unless @closed.include?(@el) and @open.include?(@el)
          @open.push(@el)
          @prevlist.push(@el)
          if @el[0] == final_x and @el[1] == final_y
            @prevlist.reverse_each do |c|
              puts "LISTEN!4"
              if c[0] == prev_x and c[1] == prev_y
                count += array[c[0]*42+c[1]]
                prev_x = c[2]
                prev_y = c[3]
                @finalarray.push([c[0],c[1]])
              end
            end
            puts @finalarray
            return count,@finalarray,@closed
          end
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


  end
end
