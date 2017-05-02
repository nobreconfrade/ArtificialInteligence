require 'ruby2d'
require_relative 'bcu.rb'
require_relative 'bfs.rb'


bcu = Bcu.new
bfs = Bfs.new
array = Array.new

size = 640
offset_x = 0.0
offset_y = 0.0
initial_x = 0
initial_y = 0
final_x = 0
final_y = 0
tick = 0

set title: "Robô busca cega"
set width: size, height: size-size/42
set resizable: false



File.open('mapa.txt','r') do |f|
  f.each_char do |c|
    if c != " " and c != "\n"
      array.push(c.to_i)
    end
  end
end

File.open('input.txt','r') do |f|
  f.each_line do |c|
    content = c.split(":")
    if content[0] == "ix"
      initial_x = content[1].to_i
    end
    if content[0] == "iy"
      initial_y = content[1].to_i
    end
    if content[0] == "fx"
      final_x = content[1].to_i.to_i
    end
    if content[0] == "fy"
      final_y = content[1].to_i.to_i
    end
  end
end

# puts initial_x
# puts initial_y
# puts final_x
# puts final_y

j = 0
i = 0

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
    if i == initial_x and j == initial_y
      Triangle.new(offset_x,offset_y,offset_x+size/42,offset_y,offset_x+(size/42)/2,offset_y+(size/42),'white')
    end
    if i == final_x and j == final_y
      Triangle.new(offset_x,offset_y,offset_x+size/42,offset_y,offset_x+(size/42)/2,offset_y+(size/42),'black')
    end
    if j == 41
      offset_y += size/42
      offset_x = 0
      next
    end
    offset_x += size/42
  end
end

cost,expnodes= bfs.solver(initial_x,initial_y,array,final_x,final_y,array[initial_x,initial_y][0])

puts cost
puts expnodes

update do
  if tick % 60 == 0
    if tick < 120

    else
    end
  end
  # puts tick
  tick += 1
end

show
