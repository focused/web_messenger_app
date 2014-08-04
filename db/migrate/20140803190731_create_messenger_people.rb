class CreateMessengerPeople < ActiveRecord::Migration
  def change
    create_table :messenger_people do |t|
      t.references :chat, null: false
      t.references :person, null: false
      t.boolean :deleted, default: false, null: false

      t.index %i(person_id chat_id), unique: true
    end
  end
end
