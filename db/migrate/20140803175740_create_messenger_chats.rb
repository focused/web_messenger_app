class CreateMessengerChats < ActiveRecord::Migration
  def change
    create_table :messenger_chats do |t|

      t.timestamps
    end
  end
end
