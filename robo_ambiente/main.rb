require_relative "window.rb"
require_relative "bcu.rb"

class Main

  bcu = Bcu.new
  window = Window.new
  # array = Array.new
  array = []


  File.open('mapa.txt','r') do |f|
    f.each_char do |c|
      if c != " " and c != "\n"
        array.push(c.to_i)
      end
    end
  end

  window.print(array)

end
