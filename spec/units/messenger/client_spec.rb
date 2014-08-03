require 'spec_helper'

module Messenger
  describe Client do
    StubChatData = Struct.new(:attributes) do
      def self.find_by(opts)
        (5..10).include?(opts[:id]) ? new(id: opts[:id]) : nil
      end
    end

    describe '#initialize' do
      it "fails without required param 'state'" do
        expect { Client.new }.to raise_error ArgumentError
      end

      it "set defaults to 'data_class = Chat'" do
        client = Client.new(double)
        expect(client.data_class).to be Chat
      end
    end

    describe '#current_chat' do
      it "returns nil without 'last_chat_id'" do
        expect(Client.new({}, StubChatData).current_chat).to be_nil
      end

      it 'returns nil without existing chat' do
        client = Client.new({ last_chat_id: 4 }, StubChatData)

        expect(client.current_chat).to be_nil
      end

      it 'finds last used chat' do
        client = Client.new({ last_chat_id: 5 }, StubChatData)

        expect(client.current_chat).to eq StubChatData.new(id: 5)
      end
    end
  end
end
