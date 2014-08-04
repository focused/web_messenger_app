module Messenger
  class ChatsPerson < ActiveRecord::Base
    # TODO: extract 'person_class_name' setting
    belongs_to :person, class_name: 'Guest'

    scope :actual, -> { where(deleted_at: nil) }
    scope :deleted, -> { where.not(deleted_at: nil) }
  end
end
