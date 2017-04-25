require 'ruby2d'
require_relative 'bccu.rb'

size = 640
offset_x = 0.0
offset_y = 0.0
tick = 0
array = []

set title: "Robô busca cega"
set width: size, height: size
set resizable: false

i = 0
j = 0
File.open('mapa.txt','r') do |f|
  f.each_char do |c|
    if c != " " and c != "\n"
      array << c.to_i
    end
  end
end

for i in 0...42 do
  for j in 0...42 do
    if array[i*42+j] == 0
      Square.new(offset_x,offset_y,size/42,'green')
    elsif array[i*42+j] == 1
      Square.new(offset_x,offset_y,size/42,'brown')
    elsif array[i*42+j] == 2
      Square.new(offset_x,offset_y,size/42,'blue')
    elsif array[i*42+j] == 3
      Square.new(offset_x,offset_y,size/42,'red')
    else
      Square.new(offset_x,offset_y,size/42,'white')
    end
    if j == 41
      offset_y += size/42
      offset_x = 0
      next
    end
    offset_x += size/42
  end
end

foo = Bccu.new(array)



# update do
#   if tick % 60 == 0
#     # do something
#   end
#   tick += 1
# end
#
# show
