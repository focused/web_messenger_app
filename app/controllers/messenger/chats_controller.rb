module Messenger
  class ChatsController < ApplicationController
    include Helpers

    def index
      @chats = Chat.all
    end

    def show
      @chat = client.current_chat

      redirect_to chats_url unless @chat
    end

    def destroy
      @chat = Chat.find(params[:id])
      @chat.destroy

      redirect_to messenger_chats_url, notice: 'Chat was successfully destroyed.'
    end
  end
end
