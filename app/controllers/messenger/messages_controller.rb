module Messenger
  class MessagesController < ApplicationController
    include Helpers

    layout :false

    def create
      @result = WriteMessage.(
        client.current_chat,
        Message.new(message_params, author_id: current_user.id)
      )
      @result.success? || render(:new)
    end

    private

    def message_params
      params.require(:messenger_message).permit(:body)
    end
  end
end
