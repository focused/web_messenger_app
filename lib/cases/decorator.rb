class Decorator < SimpleDelegator
  attr_reader :value

  def initialize(_value)
    @value = _value
    super(@value)
  end
end
