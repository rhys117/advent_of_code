require 'spec_helper'

RSpec.describe SonarSweep do
  describe '#depths_increased' do
    it 'should return example case correctly' do
      expect(
        described_class.new(file_fixture('day_1.txt')).depths_increased
      ).to eq(7)
    end
  end

  it 'should pass with personalized input' do
    expect(
      described_class.new(file_fixture('day_1_personalized.txt')).depths_increased
    ).to eq(1462)
  end

  it 'should handle continually window' do
    expect(
      described_class.new(file_fixture('day_1.txt')).depths_increased(continually_count: 3)
    ).to eq(5)
  end

  it 'should handle continually window with personalized input' do
    expect(
      described_class.new(file_fixture('day_1_personalized.txt')).depths_increased(continually_count: 3)
    ).to eq(1497)
  end
end
