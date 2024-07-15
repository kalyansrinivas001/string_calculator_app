module StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiters, numbers_without_delimiter = detect_delimiters_and_remove_header(numbers)
    nums = split_and_convert_to_integers(numbers_without_delimiter, delimiters)
    check_for_negatives(nums)
    nums.reject! { |num| num > 1000 }
    nums.sum
  end

  private

  def self.detect_delimiters_and_remove_header(numbers)
    if numbers.start_with?('//')
      header, numbers_without_delimiter = numbers.split("\n", 2)
      delimiters = extract_delimiters(header)
      [delimiters, numbers_without_delimiter]
    else
      [[",", "\n"], numbers]
    end
  end

  def self.extract_delimiters(header)
    if header.match?(/\[.*\]/)
      extract_multiple_delimiters(header)
    else
      extract_single_delimiter(header)
    end
  end

  def self.extract_single_delimiter(header)
    [header[2..]]
  end

  def self.extract_multiple_delimiters(header)
    header.scan(/\[([^\[\]]+)\]/).flatten
  end

  def self.split_and_convert_to_integers(numbers, delimiters)
    regex = Regexp.union(delimiters.map { |d| Regexp.new(Regexp.escape(d)) })
    numbers.split(regex).map(&:to_i)
  end

  def self.check_for_negatives(nums)
    negatives = nums.select { |num| num < 0 }
    if negatives.any?
      raise "negatives not allowed: #{negatives.join(', ')}"
    end
  end
end
