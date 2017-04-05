class Grid
  attr_accessor :grid_field, :grid_maxr, :grid_maxc, :grid_interactions, :grid_ants
  def initialize(maxr, maxc, interactions, ants)
    @grid_field = Hash.new(" ")
    @grid_maxr = maxr
    @grid_maxc = maxc
    @grid_interactions = interactions
    @grid_ants = ants
  end

  def to_s

  end

end
