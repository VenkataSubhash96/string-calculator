class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      custom_delim = parts[0][2]
      delimiters = [custom_delim]
      numbers = parts[1]
    end

    values = numbers.split(Regexp.union(delimiters)).map(&:to_i)
    negatives = values.select { |n| n.negative? }
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    values.sum
  end
end
