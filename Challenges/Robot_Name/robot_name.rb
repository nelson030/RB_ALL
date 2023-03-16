class Robot
  @@name_arr = []

  def initialize
    @robot_name = nil
    self.name
  end
  
  def name
    new_name = nil
    loop do
      break if @robot_name
      
      new_name = random_name
      
      if !@@name_arr.include?(new_name)
        @robot_name = new_name
        @@name_arr << @robot_name
        break
      end
    end
    
    robot_name
  end
  
  def reset
    @@name_arr.delete(@robot_name)
    @robot_name = nil
  end
  
  private
  
  attr_accessor :robot_name
  
  def random_name
    str = ""

    2.times { str << ("A".."Z").to_a[rand(26)] }
    3.times { str << rand(9).to_s }

    str
  end
end
