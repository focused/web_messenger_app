module Messenger
  module OpenChat extend self
    def call(*people)
      define_method(:people) { people }

      ensure_people(chat = ensure_chat) && chat
    end

    private

    def ensure_chat
      Chat.present_for_some(*people).first_or_create
    end

    def ensure_people(chat)
      people.each do |person|
        chat.chats_people.where(person_id: person.id).first_or_create
      end
    end

  end
end
