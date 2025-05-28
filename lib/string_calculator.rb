class StringCalculator
  def initialize
    @call_count = 0
    @add_occured_callback = nil
  end

  def add(numbers)
    @call_count += 1
    return 0 if numbers.empty?
    
    if numbers.start_with?('//')
      delimiters, numbers = extract_custom_delimiter(numbers)
      numbers = split_by_multiple_delimiters(numbers, delimiters)
    else
      numbers = numbers.split(/,|\n/)
    end

    numbers = numbers.map(&:to_i)
    validate_negative_numbers!(numbers)
    filtered_numbers = numbers.select { |n| n <= 1000 }
    sum = filtered_numbers.sum
    trigger_add_occured_event(numbers.join(','), sum)
    sum
  end

  def get_called_count
    @call_count
  end

  def add_occured(&block)
    @add_occured_callback = block
  end

  private
  
  def extract_custom_delimiter(numbers)
    delimiter_line, remaining = numbers.split("\n", 2)
    if delimiter_line.include?('[')
      delimiters = delimiter_line[2..-1].scan(/\[(.*?)\]/).map(&:first)
    else
      delimiters = [delimiter_line[2..-1]]
    end
    [delimiters, remaining]
  end

  def split_by_multiple_delimiters(numbers, delimiters)
    # Handle single delimiter case
    if delimiters.length == 1
      numbers.split(delimiters.first)
    else
      # Escape delimiters and create regex pattern
      pattern = delimiters.map { |d| Regexp.escape(d) }.join('|')
      numbers.split(/#{pattern}/)
    end
  end

  def validate_negative_numbers!(numbers)
    negatives = numbers.select { |n| n < 0 }
    return if negatives.empty?
    
    raise "negatives not allowed: #{negatives.join(', ')}"
  end

  def trigger_add_occured_event(input, sum)
    @add_occured_callback.call(input, sum) if @add_occured_callback
  end
end
