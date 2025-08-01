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

    numbers.split(Regexp.union(delimiters)).map(&:to_i).sum
  end
end
