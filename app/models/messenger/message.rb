module Messenger
  class Message < ActiveRecord::Base
    belongs_to :author

    validates :body, length: 1..1000
  end
end
