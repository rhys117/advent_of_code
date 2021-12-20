require 'rspec'

describe BinaryDiagnostic do
  describe 'gamma_rate' do
    it 'should return correctly with default input' do
      expect(
        described_class.new(file_fixture('day_3.txt')).gamma_rate
      ).to eq(22)
    end
  end

  describe 'epsilon_rate' do
    it 'should return correctly with default input' do
      expect(
        described_class.new(file_fixture('day_3.txt')).epsilon_rate
      ).to eq(9)
    end
  end

  describe 'gamma_and_epsilon_multiple' do
    it 'should return correctly with default input' do
      expect(
        described_class.new(file_fixture('day_3.txt')).gamma_and_epsilon_multiple
      ).to eq(198)
    end

    it 'should return correctly with personalized input' do
      expect(
        described_class.new(file_fixture('day_3_personalized.txt')).gamma_and_epsilon_multiple
      ).to eq(3429254)
    end
  end
end