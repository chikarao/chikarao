# Parent Class

class Butler
  def initialize(house)
    @house = house
  end

  def clean_house
    puts "#{@house.name} cleaned!"
  end
end

# Conventionally, would be saved as "building.rb"
class Building # < Matter
  attr_accessor :name, :height, :width, :length
  def initialize(name, height, width, length)
    @name = name
    @height, @width, @length = height, width, length
  end

  def floor_area
    @width * @length
  end
end

# Child Classes / Subclasses

# Conventionally, would be saved as "castle.rb"
class Castle < Building
  # Contain all the same code as we see within the Building class

  # Custom Attribute
  attr_accessor :butler

  # Custom Method(s)
  # Example of a Ruby Convention - Naming Methods

  # Instance Method
  def has_a_butler?
    # Will return "true" if the condition below is true.
    @butler != nil
  end

  # A castle always has a garden of 300 sq. m
  def floor_area
    # @width * @length + 300
    super + 300  # `super` calls `floor_area` of `Building`
  end

  # "self" refers to the Class in question
  def self.categories
    ['Medieval', 'Norman', 'Ancient']
  end
end

class Owner
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# Conventionally, would be saved as "house.rb"
class House < Building
  # Contain all the same code as we see within the Building class

  # Makes "@owner" available
  attr_accessor :name, :height, :width, :length, :owner, :butler

  def initialize(name, height, width, length)
    @name = name
    @height, @width, @length = height, width, length

    # This is automatically run every time that we create a new House instance
    # Every House instance will be associated with a Butler
    # (butlers come standard)
    @butler = Butler.new(self)
  end

  # Here, "self" will ALWAYS refer to the House class.
  def self.price_per_square_meter(city)
    case city
    when "Paris" then 9000
    when "Brussels" then 3000
    else raise Exception.new("No data for #{city}")
    end
  end

  def owner_name
    @owner.name
  end

  def to_s
    "#{@name} owned by #{self.owner_name}"

    # my_house = House.new('Ker Avel', 5, 10, 12)
    # In "my_house.to_s", "self" refers to "my_house".

    # second_house = House.new('Second House', 5, 10, 12)
    # In "second_house.to_s", "self" refers to "second_house".
  end
end

# my_castle = Castle.new('Moulinsard', 24, 50, 30)

# my_castle.butler = "Jeeves"

# We cannot call an Instance Method directly on a Class
# Castle.has_a_butler?

# We can call a Class Method when it is defined using "self"
# puts Castle.categories.join(' | ')

# puts my_castle.categories

# # Setting
# my_castle.butler = "Jeeves"

# # Getting
# puts "Ask #{my_castle.butler}"

# Name of the Castle is being "get" or "gotten"
# puts some_castle.height

# # Name of the Castle is being "set"
# some_castle.name = "New Name"

# puts some_castle.name

my_house = House.new('Ker Avel', 5, 10, 12)

owner = Owner.new("Joe")

my_house = House.new('Ker Avel', 5, 10, 12)

# Setting - Makes available "@owner" - Passing an instance of the Owner Class
# my_house.owner = owner # Instance of the Owner Class

# Automatically generated in the "initialize" method for House class
my_house.butler = Butler.new(my_house)

butler = my_house.butler


puts butler.clean_house

# Getting
# puts my_house.owner.name # Joe
# puts my_house.owner_name # Joe

# puts my_house.to_s

Nokogiri::HTML::Document.parse
