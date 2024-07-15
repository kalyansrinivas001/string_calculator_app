module StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    nums = numbers.split(',').map{|x| x.to_i}
    nums.sum
  end
end
