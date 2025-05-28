class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    
    if numbers.start_with?('//')
      delimiter, numbers = extract_custom_delimiter(numbers)
      return numbers.split(delimiter).map(&:to_i).sum
    end
    
    numbers.split(/,|\n/).map(&:to_i).sum
  end

  private
  
  def extract_custom_delimiter(numbers)
    delimiter_line, remaining = numbers.split("\n", 2)
    delimiter = delimiter_line[2..-1] # Skip the '//'
    [delimiter, remaining]
  end
end
