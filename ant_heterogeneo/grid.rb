class Grid
  attr_accessor
  def initialize(maxr, maxc, interactions, ants)
    @grid_field = Hash.new(" ")
    @grid_maxr = maxr
    @grid_maxc = maxc
    @grid_interactions = interactions
    @grid_info = info
    @grid_ants = ants
  end

  def to_s

  end

end
