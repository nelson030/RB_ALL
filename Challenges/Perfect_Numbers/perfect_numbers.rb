class PerfectNumber
  def self.classify(number)
    raise StandardError.new if (number < 1) || (number.class != Integer)
    ali_sum = 0
    
    number.times do |num|
      next if num == 0
      ali_sum += (num) if (number % (num)) == 0
    end
    
    if ali_sum == number
      return 'perfect'
    elsif ali_sum > number
      return 'abundant'
    else
      return 'deficient'
    end
  end
end