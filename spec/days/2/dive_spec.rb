require 'spec_helper'

RSpec.describe Dive do
  describe '#calculate_position_multiple' do
    it 'should return example case correctly' do
      expect(
        described_class.new(file_fixture('day_2.txt')).calculate_position_multiple!
      ).to eq(150)
    end

    it 'should return personalized case correctly' do
      expect(
        described_class.new(file_fixture('day_2_personalized.txt')).calculate_position_multiple!
      ).to eq(1_893_605)
    end
  end
end
