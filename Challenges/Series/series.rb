class Series
  def initialize(series)
    @series = series.chars.map(&:to_i)
  end

  def slices(l)
    raise ArgumentError if l > series.length
    
    arr = []
    i = 0
    
    while i + l <= series.length
      arr << series[(i...(i + l))]
      
      i += 1
    end
    
    arr
  end

  private

  attr_reader :series
end