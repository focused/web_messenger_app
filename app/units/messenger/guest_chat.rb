module Messenger
  class GuestChat
    extend CallableValue

    attr_reader :model, :current_user
    delegate :id, to: :model

    def initialize(chat, current_user)
      @model = chat
      @current_user = current_user
    end

    def companions
      model.companions(current_user).map(&GuestRole)
    end

    def companion_list
      companions.map(&:name).join(', ')
    end

    def new_message
      @new_message ||= Message.new
    end

    def messages
      model.messages.map(&ChatMessageRole)
    end
  end
end
