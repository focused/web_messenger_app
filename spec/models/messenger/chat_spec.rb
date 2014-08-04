require 'rails_helper'

RSpec.describe Messenger::Chat, type: :model do
  describe '.actual_for' do
    it "existing data with 'deleted_at = nil'" do
      chat = create(:messenger_chat)
      chats_person = chat.chats_people.actual.first

      expect(Messenger::Chat.actual_for(chats_person.person_id).size).to eq 1
    end

    it "no data with 'deleted_at = nil'" do
      chat = create(:messenger_chat)
      chats_person = chat.chats_people.deleted.first

      expect(Messenger::Chat.actual_for(chats_person.person_id).size).to eq 0
    end
  end
end
