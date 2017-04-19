require 'gosu'

class Main < Gosu::Window
  def initialize
    super 1024,860
    self.caption = "Robo busca cega"
  end

  module Tiles
    Grass = 1
    Mountain = 5
    Swamp = 10
    Lava = 15
  end


  def update

  end

  def draw

  end
end

Main.new.show
