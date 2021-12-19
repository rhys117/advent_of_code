module AdventOfCode
  class Day1
    def initialize(input)
      @input_parts = input.split.map(&:to_i)
    end

    def depths_increased(continually_count: 1)
      result = 0
      @input_parts.count.times do |count|
        next if count == 0

        if windowed_sum(index: count, continually_count: continually_count) > windowed_sum(index: count - 1, continually_count: continually_count)
          result += 1
        end
      end

      result
    end

    private

      def windowed_sum(index:, continually_count:)
        upto_index = index + continually_count - 1
        return 0 if @input_parts[upto_index].nil?

        (@input_parts[index..upto_index]).to_a.inject(:+)
      end
  end
end