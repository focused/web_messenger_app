module Messenger
  class MessagesController < ApplicationController
    include Helpers

    layout :false

    def create
      @result = WriteMessage.(
        client.current_chat,
        current_user,
        Message.new(message_params)
      )
      # Rails.logger.ap "========#{ @result.value.inspect }========"
      @result.success? || render(:new)
    end

    private

    def message_params
      params.require(:messenger_message).permit(:body)
    end
  end
end
