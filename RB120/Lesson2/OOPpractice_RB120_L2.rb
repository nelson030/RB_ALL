# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     parse_full_name(full_name)
#   end

#   def name
#     "#{first_name} #{last_name}".strip
#   end

#   def name=(full_name)
#     parse_full_name(full_name)
#   end
  
#   def to_s
#     name
#   end

#   private

#   def parse_full_name(full_name)
#     parts = full_name.split
#     self.first_name = parts.first
#     self.last_name = parts.size > 1 ? parts.last : ''
#   end
# end

# bob = Person.new("Robert Smith")
# puts "The person's name is: #{bob}"

# -----------------------------------------------------------------------------

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end

  def swim
    'swimming!'
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

pete.run                # => "running!"
#pete.speak              # => NoMethodError

kitty.run               # => "running!"
kitty.speak             # => "meow!"
#kitty.fetch             # => NoMethodError

dave.speak              # => "bark!"

bud.run                 # => "running!"
bud.swim                # => "can't swim!"

# Hierarchy: Pet -> Dog -> Bulldog
#             |
#             v
#            Cat

puts Cat.ancestors