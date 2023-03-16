class Triangle
  attr_reader :side_arr

  def initialize(side1, side2, side3)
    @side_arr = [side1, side2, side3]
    @side_arr.sort!
    if @side_arr.any? { |num| num <= 0}
      raise ArgumentError.new("All sides need to be greater than 0!")
    elsif @side_arr[2] >= (@side_arr[0] + @side_arr[1])
      raise ArgumentError.new("One side is longer than sum of the other two!")
    end
  end
  
  def kind
    if (side_arr[0] == side_arr[1]) && (side_arr[0] == side_arr[2])
      return 'equilateral'
    elsif (side_arr[0] == side_arr[1]) || (side_arr[0] == side_arr[2]) ||
          (side_arr[1] == side_arr[2])
      return 'isosceles'
    else
      return 'scalene'
    end
  end
end