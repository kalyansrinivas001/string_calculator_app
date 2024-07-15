module StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    delimiter = detect_delimiter(numbers)
    numbers_without_delimiter = remove_delimiter_header(numbers)
    nums = numbers_without_delimiter.split(delimiter).map { |x| x.to_i }
    # nums = numbers.split(/[,\n]/).map{|x| x.to_i}
    negatives = nums.select { |num| num < 0 }
    if negatives.any?
      raise "negatives not allowed: #{negatives.join(', ')}"
    end
    nums.sum
  end

  private
  def self.detect_delimiter(numbers)
    delimiter_match = numbers.match(/^\/\/(.+)\n/)
    delimiter_match ? Regexp.escape(delimiter_match[1]) : /[,\n]/
  end

  def self.remove_delimiter_header(numbers)
    numbers.sub(/^\/\/.+?\n/, '')
  end

end
