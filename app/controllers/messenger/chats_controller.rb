module Messenger
  class ChatsController < ApplicationController
    include Helpers

    def index
      @guests = Guest.except_one(current_user)
    end

    def show
      redirect_to(chats_url) and return unless client.current_chat?

      @chat = GuestChat.new(client.current_chat, current_user)
    end

    def new
      @chat = OpenChat.(current_user, Guest.find(params[:guest_id]))
      set_client last_chat_id: @chat.id

      redirect_to root_url
    end

    def destroy
      @chat = Chat.find(params[:id])
      @chat.soft_destroy

      redirect_to messenger_chats_url, notice: 'Chat was successfully destroyed.'
    end
  end
end
