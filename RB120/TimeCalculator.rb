class TimeCalculator
  TIME_LIMIT = 180 # minutes
  
  attr_reader:time_per_point
  
  def initialize(total_points)
    @time_per_point = TIME_LIMIT / total_points.to_f
  end
  
  def time_for_question(points)
    puts "You have #{@time_per_point * points} minutes for this question."
  end
end

test1 = TimeCalculator.new(80)
test1.time_for_question(7)