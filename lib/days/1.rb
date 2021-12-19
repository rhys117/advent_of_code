module AdventOfCode
  class Day1
    def self.depths_increased(string)
      parts = string.split
      parts.select.with_index do |num, idx|
        next if idx == 0

        num > parts[idx - 1]
      end.count
    end
  end
end