class Patient
  def initialize(attributes = {})
@name = attributes[:name] ||
@cured = attributes[:cured] || false
  end
