module Messenger
  module OpenChat extend self
    def call(*two_people)
      define_method(:people) { two_people }

      ensure_people(chat = ensure_chat) && chat
    end

    private

    def ensure_chat
      Chat.where(id: shared_id).first_or_create
    end

    def shared_id
      people.map(&get_chat_ids).reduce(:&).first
    end

    def get_chat_ids
      -> person { Chat.actual_for(person).pluck(:id) }
    end

    def ensure_people(chat)
      people.each do |person|
        chat.chats_people.where(person_id: person.id).first_or_create
      end
    end

  end
end
