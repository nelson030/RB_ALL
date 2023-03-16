# class GoodDog
#   attr_accessor :name, :height, :weight
  
#   # GETTER:
#   # def name
#   #   @name
#   # end
  
#   # SETTER:
#   # def name=(n)
#   #   @name = n
#   # end

#   # .new() finds initialize() FIRST
#   def initialize(n, h, w)
#     @name = n
#     @height = h
#     @weight = w
#   end
  
#   # runs when class object is called with .speak
#   def speak
#     "#{name} says arf!"
#   end
  
#   # runs when class object is called with .change_info(n, h, w)
#   def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#     # self. lets Ruby know to call the setter method, NOT create a local variable
#   end
  
#   # runs when class object is called with .info
#   def info
#     "#{name} weighs #{weight} and is #{height} tall."
#   end
# end

# sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
# puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.

# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.

# ------------------------------------------------------------------------

# class MyCar

#   def self.what_am_i         # Class method definition
    
#     "I'm a MyCar class!"
#   end
  
#   def self.gas_mileage(gallons, miles)
#     puts "#{miles / gallons} miles per gallon of gas"
#   end
  
#   attr_accessor :speed, :color, :model
#   attr_reader :year
  
#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @speed = 0
#   end
  
#   def speed_up_by(s)
#     self.speed += s
#     "You sped up by #{s} mph. You're now going #{speed} mph."
#   end
  
#   def brake_by(s)
#     self.speed -= s
#     self.speed = 0 if self.speed < 0
#     "You slowed down by #{s} mph. You're now going #{speed} mph."
#   end
  
#   def current_speed
#     "You're current_speed is #{speed} mph."
#   end
  
#   def shut_down
#     if speed == 0
#       "You shut down the car!"
#     else
#       "You need to slow down to 0 before stopping. You're going #{speed} mph."
#     end
#   end
  
#   def spray_paint(c)
#     self.color = c
#     "You spray painted the car. It's now #{color}."
#   end
  
#   def to_s
#     "You drive a #{year} #{color} #{model}."
#   end
  
# end

# puts MyCar.gas_mileage(25, 100)

# camry = MyCar.new("2017", "Gray", "Toyota Camry")
# puts camry.to_s

# # puts camry.current_speed
# # camry.speed_up_by(25)
# # puts camry.current_speed
# # camry.brake_by(20)
# # puts camry.current_speed
# # puts camry.shut_down
# # camry.brake_by(10)
# # puts camry.current_speed
# # puts camry.shut_down
# # puts "------------------"
# # puts camry.color
# # camry.color = "Red"
# # puts camry.color
# # puts camry.year
# # puts "------------------"
# # puts camry.spray_paint("White")
# # puts "------------------"

# ------------------------------------------------------------------------

# module Swimmable
#   def swim
#     "I'm swimming!"
#   end
# end

# class Animal
#   def speak
#     "Hello!"
#   end
# end

# class Fish < Animal
#   include Swimmable         # mixing in Swimmable module
# end

# class Dog < Animal
#   include Swimmable
  
#   attr_accessor :name

#   def initialize
#   end

#   def speak
#     super + " from GoodDog class"
#   end
# end

# class Cat < Animal
# end

# sparky = Dog.new
# neemo  = Fish.new

# p sparky.swim                 # => I'm swimming!
# p neemo.swim                  # => I'm swimming!                # => NoMethodError: undefined method `swim' for #<Cat:0x007fc453152308>

# ------------------------------------------------------------------------

# module OffRoadable
#   def off_road
#     "I can drive off-road!"
#   end
# end

# class Vehicle
#   @@num_of_vehicles = 0
  
#   CURRENT_YEAR = Time.now.year
  
#   def self.num_of_vehicles
#     "This program created #{@@num_of_vehicles} vehicles."
#   end
  
#   def gas_mileage(miles, gal)
#     "Your vehicle gets #{miles/gal} miles per gallon."
#   end
  
#   attr_accessor :speed, :color, :model
#   attr_reader :year
  
#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @speed = 0
#     @@num_of_vehicles += 1
#   end
  
#   def speed_up_by(s)
#     self.speed += s
#     "You sped up by #{s} mph. You're now going #{speed} mph."
#   end
  
#   def brake_by(s)
#     self.speed -= s
#     self.speed = 0 if self.speed < 0
#     "You slowed down by #{s} mph. You're now going #{speed} mph."
#   end
  
#   def current_speed
#     "You're current speed is #{speed} mph."
#   end
  
#   def shut_down
#     if speed == 0
#       "You shut down the car!"
#     else
#       "You need to slow down to 0 before stopping. You're going #{speed} mph."
#     end
#   end
  
#   def spray_paint(c)
#     self.color = c
#     "You spray painted the car. It's now #{color}."
#   end
  
#   def to_s
#     "You drive a #{year} #{color} #{model}."
#   end
  
#   def show_age
#     "The vehicle is #{current_age} years old."
#   end
  
#   private
  
#   def current_age
#     CURRENT_YEAR - year.to_i
#   end
# end

# class MyCar < Vehicle
#   NUM_OF_DOORS = 4
# end

# class MyTruck < Vehicle
#   include OffRoadable
#   NUM_OF_DOORS = 2
# end

# camry = MyCar.new('2017', 'grey', 'Toyota Camry')
# tundra = MyTruck.new('2020', 'beige', 'Toyota Tundra')

# p camry.gas_mileage(25, 1)
# p tundra.gas_mileage(20, 1)

# p tundra.off_road

# p Vehicle.num_of_vehicles

# puts Vehicle.ancestors
# p "~~~~~~~~~~~~~~~"
# puts MyCar.ancestors
# p "~~~~~~~~~~~~~~~"
# puts MyTruck.ancestors
# p "~~~~~~~~~~~~~~~"

# p tundra.speed_up_by(25)
# p tundra.current_speed
# p tundra.brake_by(20)
# p tundra.current_speed
# p tundra.shut_down
# p tundra.brake_by(10)
# p tundra.shut_down
# p "~~~~~~~~~~~~~~~"

# lumina = MyCar.new(1997, 'white', 'chevy lumina')
# lumina.speed_up_by(20)
# lumina.current_speed
# lumina.speed_up_by(20)
# lumina.current_speed
# lumina.brake_by(20)
# lumina.current_speed
# lumina.brake_by(20)
# lumina.current_speed
# lumina.shut_down
# lumina.gas_mileage(25, 1)
# lumina.spray_paint("red")
# puts lumina

# p "~~~~~~~~~~~~~~~"

# p camry.show_age
# p tundra.show_age
# p lumina.show_age

# class Student
#   attr_accessor :name
#   attr_writer :grade
  
#   def initialize(n, g)
#     @name = n
#     @grade = g
#   end
  
#   def better_grade_than?(person)
#     grade > person.grade
#   end
  
#   protected
  
#   attr_reader :grade
# end

# joe = Student.new("Joe", 91)
# bob = Student.new("Bob", 73)

# puts "Well done!" if joe.better_grade_than?(bob)

class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end
  
  def state
    @switch
  end
  
  def flip_switch(desired_state)
    self.switch = desired_state
  end
  
  private
  
  attr_accessor :switch
end

switch = Machine.new
switch.start
puts switch.state
switch.stop
puts switch.state
