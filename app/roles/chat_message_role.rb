class ChatMessageRole < ModelDecorator
  extend CallableValue

  delegate :name, to: :author, allow_nil: true

  def author_name_with_time
    "#{name} (#{created_at})"
  end
end
