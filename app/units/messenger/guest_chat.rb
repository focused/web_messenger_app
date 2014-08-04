module Messenger
  class GuestChat
    extend CallableValue

    attr_reader :companion
    delegate :name, to: :companion

    def initialize(remote_guest)
      @companion = remote_guest
    end

    def companion_id
      companion.id
    end
  end
end
