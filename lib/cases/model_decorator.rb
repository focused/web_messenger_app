require './lib/cases/decorator'

class ModelDecorator < Decorator
  alias :model :value
  delegate :id, :persisted?, to: :model

  def to_model
    self
  end

  def class
    model.class
  end
end
