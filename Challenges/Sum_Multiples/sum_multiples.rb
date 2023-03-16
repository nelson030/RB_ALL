class SumOfMultiples
  def initialize(*nums)
    @arr = []
    nums.map { |num| @arr << num }
  end
  
  def to(num)
    sum = 0
    
    num.times do |n|
      next if n == 0
      
      sum += n if arr.any? { |multiple| (n % multiple) == 0 }
    end
    
    sum
  end
  
  def self.to(num)
    SumOfMultiples.new(3, 5).to(num)
  end
  
  private
  
  attr_reader :arr
end