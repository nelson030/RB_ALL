class Father
  attr_reader :name
  
  def name=(new_name)
    @name = "Mr. " + new_name
  end

  def initialize(name)
    self.name = name
  end
end

rob = Father.new("Rob")

puts rob.name
rob.name = "Bob"
puts rob.name
