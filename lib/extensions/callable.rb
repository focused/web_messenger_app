module Callable
  def self.extended(base)
    alias :[] :curry
  end

  def to_proc
    method(:call)
  end

  def curry
    to_proc.curry
  end
end
