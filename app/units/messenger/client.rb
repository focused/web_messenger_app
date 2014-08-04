module Messenger
  class Client
    attr_reader :state, :data_class

    def initialize(state, data_class = Chat)
      @state = state || {}
      @data_class = data_class
    end

    def current_chat
      @current_chat ||= data_class.find_by(id: state[:last_chat_id])
    end
    alias :current_chat? :current_chat
  end
end
