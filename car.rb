# def Car
#   def initialize
# puts "Here is my new instance of Car"
#   end
# end
class Car
  attr_reader :color :engine_started
  def initialize(color)
@color = color
@engine_started = false
  end

  def engine_started?
    return @engine_started
  end

def start_engine
    @engine_started = true
  end
  def color=(new_color)
    @color = new_color
end

# Car.new("Blue")
