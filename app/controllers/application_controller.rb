class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include UsersHelper

  before_action :authenticate!

  protected

  def authenticate!
    current_user.authenticated? || redirect_to(new_guest_url)
  end
end
