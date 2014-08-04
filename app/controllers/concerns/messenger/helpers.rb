module Messenger
  module Helpers
    def client
      @client ||= Client.new(session[:messenger].symbolize_keys!)
    end

    def set_client(new_state)
      session[:messenger] = session.fetch(:messenger, {}).merge(new_state)
      client
    end
    alias :client= :set_client
  end
end

