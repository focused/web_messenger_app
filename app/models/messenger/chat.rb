module Messenger
  class Chat < ActiveRecord::Base
    has_many :chats_people

    scope :actual_for, -> person_id do
      all
        .joins(:chats_people)
        .merge ChatsPerson.actual.where(person_id: person_id)
    end
  end
end
