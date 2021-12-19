require 'spec_helper'

RSpec.describe DiveWithAim do
  describe '#calculate_position_multiple!' do
    it 'should return example case correctly' do
      expect(
        described_class.new(file_fixture('day_2.txt')).calculate_position_multiple!
      ).to eq(900)
    end

    it 'should return personalized case correctly' do
      expect(
        described_class.new(file_fixture('day_2_personalized.txt')).calculate_position_multiple!
      ).to eq(2_120_734_350)
    end
  end
end
