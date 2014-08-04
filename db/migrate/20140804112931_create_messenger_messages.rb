class CreateMessengerMessages < ActiveRecord::Migration
  def change
    create_table :messenger_messages do |t|
      t.references :chat, index: true
      t.references :author
      t.text :body

      t.timestamps
    end
  end
end
