class Ants
  # NOTE: '@@' means shared variable through objects
  @@ant_total = 0
  def initialize(positionx,positiony,working)
    @ant_positionx = positionx
    @ant_positiony = positiony
    @ant_working = working
    @@ant_total += 1
  end
end
