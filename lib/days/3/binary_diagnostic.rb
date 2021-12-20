class BinaryDiagnostic
  attr_reader :gamma_rate, :epsilon_rate

  def initialize(input_string)
    @split_binary_strings = input_string.split
    @binary_strings_count = @split_binary_strings.count
    @count_map = determine_count_map
    @gamma_rate = determine_gamma
    @epsilon_rate = determine_epilson
  end

  def gamma_and_epsilon_multiple
    @gamma_rate * @epsilon_rate
  end

  private

  def determine_count_map
    results = Hash.new(0)
    @split_binary_strings.each do |str|
      str.split('').each_with_index { |str_int, index| results[index] += 1 if str_int == '1' }
    end

    results
  end

  def determine_gamma
    str = ''
    (@split_binary_strings.first.size).times do |position|
      str << determine_bit(@count_map[position])
    end

    str.to_i(2)
  end

  def determine_epilson
    str = ''
    (@split_binary_strings.first.size).times do |position|
      str << determine_bit(@count_map[position], most_common: false)
    end

    str.to_i(2)
  end

  def determine_bit(one_count, most_common: true)
    one_count_greatest = one_count > (@binary_strings_count / 2)
    if one_count_greatest && most_common
      '1'
    elsif one_count_greatest && !most_common
      '0'
    elsif !most_common
      '1'
    else
      '0'
    end
  end
end