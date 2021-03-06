module Messenger
  module WriteMessage extend self
    def call(chat, author, message)
      define_method(:message) { message }

      message.author_id = author.id
      (chat.messages << message) ? message_item : message_form
    end

    private

    def message_item
      Success.new(ChatMessageRole.new(message))
    end

    def message_form
      Failure.new(message)
    end
  end
end
