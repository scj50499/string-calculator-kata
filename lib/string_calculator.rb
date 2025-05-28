class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    
    if numbers.start_with?('//')
      delimiter, numbers = extract_custom_delimiter(numbers)
      numbers = numbers.split(delimiter)
    else
      numbers = numbers.split(/,|\n/)
    end

    numbers = numbers.map(&:to_i)
    validate_negative_numbers!(numbers)
    numbers.sum
  end

  private
  
  def extract_custom_delimiter(numbers)
    delimiter_line, remaining = numbers.split("\n", 2)
    delimiter = delimiter_line[2..-1] # Skip the '//'
    [delimiter, remaining]
  end

  def validate_negative_numbers!(numbers)
    negatives = numbers.select { |n| n < 0 }
    return if negatives.empty?
    
    raise "negatives not allowed: #{negatives.join(', ')}"
  end
end
