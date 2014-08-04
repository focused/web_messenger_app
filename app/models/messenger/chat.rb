module Messenger
  class Chat < ActiveRecord::Base
    has_many :chats_people, dependent: :destroy
    has_many :people, through: :chats_people
    has_many :messages, class_name: Messenger::Message, dependent: :destroy

    scope :actual_for, -> person do
      all
        .joins(:chats_people)
        .merge ChatsPerson.actual.where(person_id: person.id)
    end

    # scope :present_for_some, -> *people do
    #   all
    #     .joins(:chats_people)
    #     .merge ChatsPerson.where(person_id: people.map(&:id))
    # end

    def companions(user)
      people.where.not(id: user.id)
    end

    def soft_destroy
      update_column(deleted_at: Time.now)
    end
  end
end
