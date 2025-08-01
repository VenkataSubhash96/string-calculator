class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter_part = parts[0][2..]

      if delimiter_part.start_with?("[")
        delimiters = delimiter_part.scan(/\[(.+?)\]/).flatten
      else
        delimiters = [delimiter_part]
      end

      numbers = parts[1]
    end

    values = numbers.split(Regexp.union(delimiters)).map(&:to_i)
    negatives = values.select { |n| n.negative? }
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    values.reject { |n| n > 1000 }.sum
  end
end
