class BinaryDiagnostic
  attr_reader :gamma_rate, :epsilon_rate, :oxygen_generator_rating, :o2_scrubber_rating

  def initialize(input_string)
    @split_binary_strings = input_string.split
    @binary_strings_count = @split_binary_strings.count
    @binary_parts_size = @split_binary_strings.first.size
    @default_count_map = determine_count_map(@split_binary_strings)
    @gamma_rate = determine_gamma
    @epsilon_rate = determine_epilson
    @oxygen_generator_rating = determine_oxygen_generator_rating
    @o2_scrubber_rating = determine_o2_scrubber_rating
  end

  def gamma_and_epsilon_multiple
    @gamma_rate * @epsilon_rate
  end

  def oxygen_generator_and_o2_scrubber_multiple
    @oxygen_generator_rating * @o2_scrubber_rating
  end

  private

  def determine_count_map(parts, position: nil, most_common: true)
    results = Hash.new(0)
    parts.each do |str|
      str.split('').each_with_index { |str_int, index| results[index] += 1 if str_int == '1' }
    end

    unless position.nil?
      determined_filter = determine_bit(results[position], most_common: most_common, parts_count: @filtered_parts.count)
      @filtered_parts = parts.select { |part| part[position] == determined_filter }
      determine_count_map(@filtered_parts)
    end

    results
  end

  def determine_gamma
    str = ''
    @binary_parts_size.times do |position|
      str << determine_bit(@default_count_map[position])
    end

    str.to_i(2)
  end

  def determine_epilson
    str = ''
    @binary_parts_size.times do |position|
      str << determine_bit(@default_count_map[position], most_common: false)
    end

    str.to_i(2)
  end

  def determine_oxygen_generator_rating
    @filtered_parts = @split_binary_strings.dup
    count_map = nil
    position = 0
    until @filtered_parts.size == 1
      count_map = determine_count_map(@filtered_parts, position: position)
      position += 1
    end

    @filtered_parts.first.to_i(2)
  end

  def determine_o2_scrubber_rating
    @filtered_parts = @split_binary_strings.dup
    count_map = nil
    position = 0
    until @filtered_parts.size == 1
      count_map = determine_count_map(@filtered_parts, position: position, most_common: false)
      position += 1
    end

    @filtered_parts.first.to_i(2)
  end

  def determine_bit(one_count, most_common: true, parts_count: @binary_strings_count)
    one_count_greater = one_count >= (parts_count.to_f / 2)
    if one_count_greater && most_common
      '1'
    elsif one_count_greater && !most_common
      '0'
    elsif !most_common
      '1'
    else
      '0'
    end
  end
end