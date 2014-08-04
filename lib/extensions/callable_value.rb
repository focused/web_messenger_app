module CallableValue extend Callable
  def self.extended(base)
    alias :[] :curry
  end

  def to_proc
    method(:new).to_proc
  end

  def curry(value)
    -> *xs { new(value, *xs) }
  end
end
