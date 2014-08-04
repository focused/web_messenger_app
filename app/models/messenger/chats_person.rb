module Messenger
  class ChatsPerson < ActiveRecord::Base
    scope :actual, -> { where(deleted_at: nil) }
    scope :deleted, -> { where.not(deleted_at: nil) }
  end
end
