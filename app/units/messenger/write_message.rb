module Messenger
  module WriteMessage extend self
    def call(chat, message)
      define_method(:message) { message }

      chat.messages << message ? message_item : message_form
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
