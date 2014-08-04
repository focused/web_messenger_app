module Messenger
  class Message < ActiveRecord::Base
    # TODO: extract 'person_class_name' setting
    belongs_to :author, class_name: 'Guest'

    validates :body, length: 1..1000
  end
end
