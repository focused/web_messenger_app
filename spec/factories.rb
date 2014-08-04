FactoryGirl.define do
  factory :messenger_chat, class: Messenger::Chat do
    after :build do |m, e|
      m.chats_people.build attributes_for(:messenger_chats_person)
      m.chats_people.build attributes_for(:deleted_messenger_chats_person)
    end
  end

  factory :messenger_chats_person, class: Messenger::ChatsPerson do
    person_id { rand(100000) + 1 }

    factory :deleted_messenger_chats_person do
      deleted_at { Time.now }
    end
  end
end
