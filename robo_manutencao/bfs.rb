require_relative 'magic.rb'
class Bfs
  def solver(pos_x,pos_y,array,final_x,final_y,initial_cost)
    @open = Array.new
    @open.push([pos_x,pos_y,nil,nil])
    @closed = Array.new
    @array = array
    @prevlist = Array.new
    @prevlist.push([pos_x,pos_y,nil,nil])

    count = 0
    @finalarray = []

    while !@open.empty?
      @e = @open.first
      unless @closed.include?([@e[0],@e[1]])
        @closed.push([@e[0],@e[1]])
      end
      @open.delete_at(0)
      if @e[0] - 1 >= 0
        @el = [@e[0] - 1,@e[1],@e[0],@e[1]]
        unless @closed.include?([@el[0],@el[1]]) or @open.include?(@el)
          @open.push(@el)
          @prevlist.push(@el)
          if @el[0] == final_x and @el[1] == final_y
            prev_x = @el[2]
            prev_y = @el[3]
            @prevlist.reverse_each do |c|
              if c[0] == prev_x and c[1] == prev_y
                count += array[c[0]*42+c[1]]
                prev_x = c[2]
                prev_y = c[3]
                @finalarray.push([c[0],c[1]])
              end
            end
            # print @closed
            return count,@finalarray,@closed
          end

        end
      end
      if @e[1] + 1 < 42
        @el = [@e[0],@e[1] + 1, @e[0], @e[1]]
        unless @closed.include?([@el[0],@el[1]]) or @open.include?(@el)
          @open.push(@el)
          @prevlist.push(@el)
          if @el[0] == final_x and @el[1] == final_y
            prev_x = @el[2]
            prev_y = @el[3]
            @prevlist.reverse_each do |c|
              if c[0] == prev_x and c[1] == prev_y
                count += array[c[0]*42+c[1]]
                prev_x = c[2]
                prev_y = c[3]
                @finalarray.push([c[0],c[1]])
              end
            end
            # print @closed
            return count,@finalarray,@closed
          end

        end
      end
      if @e[0] + 1 < 42
        @el = [@e[0] + 1,@e[1], @e[0], @e[1]]
        unless @closed.include?([@el[0],@el[1]]) or @open.include?(@el)
          @open.push(@el)
          @prevlist.push(@el)
          if @el[0] == final_x and @el[1] == final_y
            prev_x = @el[2]
            prev_y = @el[3]
            @prevlist.reverse_each do |c|
              if c[0] == prev_x and c[1] == prev_y
                count += array[c[0]*42+c[1]]
                prev_x = c[2]
                prev_y = c[3]
                @finalarray.push([c[0],c[1]])
              end
            end
            # print @closed
            return count,@finalarray,@closed
          end
        end
      end
      if @e[1] - 1 >= 0
        @el = [@e[0],@e[1] - 1, @e[0], @e[1]]
        unless @closed.include?([@el[0],@el[1]]) or @open.include?(@el)
          @open.push(@el)
          @prevlist.push(@el)
          if @el[0] == final_x and @el[1] == final_y
            prev_x = @el[2]
            prev_y = @el[3]
            @prevlist.reverse_each do |c|
              if c[0] == prev_x and c[1] == prev_y
                count += array[c[0]*42+c[1]]
                prev_x = c[2]
                prev_y = c[3]
                @finalarray.push([c[0],c[1]])
              end
            end
            return count,@finalarray,@closed
          end

        end
      end
    end
  end
end
