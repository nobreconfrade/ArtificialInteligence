require_relative "antsmethods.rb"

class Ants < AntsMethods

  maxlenght = 30
  maxheight = 30
  methods = AntsMethods.new
  puts "Informe o tamanho da grid de formigas:"
  puts "!UNDER CONSTRUCTION, 50 DEFAULT!"
  grid = methods.populate_grid(maxlenght,maxheight)
  methods.show_grid(grid,maxlenght,maxheight)

end
