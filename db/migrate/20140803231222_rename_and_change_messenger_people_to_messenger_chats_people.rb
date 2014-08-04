class RenameAndChangeMessengerPeopleToMessengerChatsPeople < ActiveRecord::Migration
  def change
    change_table :messenger_people do |t|
      reversible do |dir|
        dir.up do
          t.change :deleted, :datetime, default: nil, null: true
        end
        dir.down do
          t.change :deleted, :boolean, default: false, null: false
        end
      end
      t.rename :deleted, :deleted_at
    end

    rename_table :messenger_people, :messenger_chats_people
  end
end
