class SuccessFailure
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def success?
    raise 'Not implemented'
  end

  def failure?
    !success?
  end
end

class Success < SuccessFailure
  def success?
    true
  end
end

class Failure < SuccessFailure
  def success?
    false
  end
end

