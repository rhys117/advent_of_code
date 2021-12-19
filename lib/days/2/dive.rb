class Dive
  def initialize(input)
    @x_pos = 0
    @y_pos = 0

    @commands_and_args = DivePresenter.possible_commands_from_input(input)
  end

  def calculate_position_multiple!
    @commands_and_args.each { |command, args| send(command.downcase, *args) }

    @x_pos * @y_pos
  end

  private

  def up(depth)
    @y_pos -= depth
  end

  def down(depth)
    @y_pos += depth
  end

  def forward(distance)
    @x_pos += distance
  end
end
