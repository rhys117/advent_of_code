require 'spec_helper'

RSpec.describe AdventOfCode::Day1 do
  describe '#depths_increased' do
    it 'should return example case correctly' do
      expect(
        described_class.depths_increased(file_fixture('day_1.txt'))
      ).to eq(7)
    end
  end
end