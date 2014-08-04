module Messenger
  module Helpers
    def client
      @client ||= Client.new(session_messenger)
    end

    def set_client(new_state)
      session[:messenger] = session_messenger.merge(new_state)
      client
    end
    alias :client= :set_client

    private

    def session_messenger
      session.fetch(:messenger, {}).symbolize_keys!
    end
  end
end

