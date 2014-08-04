module Messenger
  class ChatsController < ApplicationController
    include Helpers

    def index
      @chats = Guest.all.map(&GuestChat)
    end

    def show
      @chat = client.current_chat
      @companions = @chat.companions(current_user).map(&GuestRole)

      redirect_to chats_url unless @chat
    end

    def new
      @chat = Messenger::OpenChat.(current_user, Guest.find(params[:guest_id]))
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
