module UsersHelper
  def current_user
    # TODO: when using Devise replace with:
    #   @current_user ||= UserRole.new(super) || CurrentGuestFactory.(session)
    @current_user ||= CurrentGuestFactory.(session)
  end

  def signed_in?
    current_user.authenticated?
  end

  module CurrentGuestFactory extend self
    def call(state)
      GuestRole.new(find_guest(state[:current_guest_id]) || Guest.new)
    end

    private def find_guest(guest_id)
      guest_id && Guest.find_by(id: guest_id)
    end
  end
end
