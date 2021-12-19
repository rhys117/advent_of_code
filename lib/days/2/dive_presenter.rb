class DivePresenter
  VALID_COMMANDS = %w[FORWARD DOWN UP].freeze

  class << self
    def possible_commands_from_input(input)
      input.upcase.split("\n").map do |line|
        determine_command_and_args(line)
      end.compact
    end

    private

    def determine_command_and_args(str)
      parts = str.strip.split(/\W+/)
      return unless VALID_COMMANDS.include?(parts.first)

      [parts.first, parts[1..].map(&:to_i)]
    end
  end
end
