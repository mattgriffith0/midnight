class Die
  def initialize(sides=6)
      @sides = sides
  end

  def generate_roll
      rand(@sides) + 1
  end
end