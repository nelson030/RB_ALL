#1

# module Mailable
#   def print_address
#     puts "#{name}"
#     puts "#{address}"
#     puts "#{city}, #{state} #{zipcode}"
#   end
# end

# class Customer
#   include Mailable
  
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# class Employee
#   include Mailable
  
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# betty = Customer.new 
# bob = Employee.new
# betty.print_address
# bob.print_address

#2

# module Drivable
#   def drive
#   end
# end

# class Car
#   include Drivable
# end

# bobs_car = Car.new
# bobs_car.drive

#3

# class House
#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end
  
#   def <=>(other)
#     price <=> other.price
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2 # Home 1 is cheaper
# puts "Home 2 is more expensive" if home2 > home1 # Home 2 is more expensive

#4

# class Transform
  
#   def initialize(str)
#     @word = str
#   end
  
#   def uppercase
#     @word.upcase
#   end
  
#   def self.lowercase(str)
#     str.downcase
#   end
  
# end

# my_data = Transform.new('abc') # ABC
# puts my_data.uppercase
# puts Transform.lowercase('XYZ') # xyz

#6


# class Wallet
#   include Comparable

#   def initialize(amount)
#     @amount = amount
#   end

#   def <=>(other_wallet)
#     amount <=> other_wallet.amount
#   end
  
#   protected
  
#   attr_reader :amount
# end

# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)
# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end

#8
# module Walk
#   def walk
#     puts "#{self.name} #{gait} forward."
#   end
# end

# class Person
#   include Walk
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end

# class Cat
#   include Walk
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah
#   include Walk
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "runs"
#   end
# end

# mike = Person.new("Mike")
# mike.walk
# # => "Mike strolls forward"

# kitty = Cat.new("Kitty")
# kitty.walk
# # => "Kitty saunters forward"

# flash = Cheetah.new("Flash")
# flash.walk
# # => "Flash runs forward"

#7
class Pet
  attr_reader :type, :name
  
  def initialize(type, name)
    @type = type
    @name = name
  end
  
  def to_s
    "a #{type} named #{name}"
  end
end

class Owner
  attr_reader :owner_name
  attr_accessor :number_of_pets
  
  def initialize(owner_name)
    @owner_name = owner_name
    @number_of_pets = 0
  end
  
  def name
    owner_name
  end
end

class Shelter
  attr_accessor :adoption_hash
  
  def initialize
    @adoption_hash = {}
  end
  
  def adopt(owner, animal)
    owner.number_of_pets += 1
    if adoption_hash[owner.name]
      adoption_hash[owner.name] << animal
    else
      adoption_hash[owner.name] = [animal]
    end
  end
  
  def print_adoptions
    adoption_hash.each do |owner, animals|
      puts "#{owner} has adopted the following pets:"
      animals.each do |animal|
        puts animal
      end
      puts ""
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
