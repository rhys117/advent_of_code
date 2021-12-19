class DiveWithAim < Dive
  def initialize(input)
    @aim = 0
    super
  end

  private

  def down(depth)
    @aim += depth
  end

  def up(depth)
    @aim -= depth
  end

  def forward(distance)
    @y_pos += @aim * distance unless @aim.zero?

    super
  end
end