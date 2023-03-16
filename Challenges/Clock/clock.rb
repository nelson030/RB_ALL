class Clock
  def self.at(hour, min=0)
    Clock.new(hour, min)
  end
  
  def initialize(hour, min)
    @hours = hour
    @minutes = min
  end
  
  def +(num)
    h = @hours.dup
    m = @minutes.dup
    
    h = h + reduce_hours(num)
    num = num - (60 * reduce_hours(num))
    
    if (num + m) > 59
      h += 1
      m = (num -= m)
    else
      m += num
    end
    
    h %= 24
    
    Clock.at(h, m)
  end
  
  def -(num)
    h = @hours.dup
    m = @minutes.dup
    
    h = h - reduce_hours(num)
    num = num - (60 * reduce_hours(num))
    
    if num > m
      h -= 1
      m -= (num -= 60)
    else
      m -= num
    end
    
    h %= 24
    
    Clock.at(h, m)
  end
  
  def to_s
    @hours = @hours.to_s.insert(0, "0") if @hours.to_s.length == 1
    @minutes = @minutes.to_s.insert(0, "0") if @minutes.to_s.length == 1
    
    "#{@hours.to_s}:#{@minutes.to_s}"
  end
  
  def ==(other)
    self.to_s == other.to_s
  end
  
  protected
  
  attr_reader :hours, :minutes
  
  private
  
  def reduce_hours(min)
    min / 60
  end
end
