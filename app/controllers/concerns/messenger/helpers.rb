module Messenger
  module Helpers
    def client
      @client ||= Client.new(session[:messenger])
    end

  end
end

