module Messenger
  class ChatsController < ApplicationController
    def index
      @chats = Chat.all
    end

    def show
      @chat = Chat.find(params[:id]) if params[:id]
    end

    def destroy
      @chat = Chat.find(params[:id])
      @chat.destroy

      redirect_to messenger_chats_url, notice: 'Chat was successfully destroyed.'
    end
  end
end
