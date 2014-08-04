class GuestsController < ApplicationController
  skip_before_action :authenticate!, only: %i(new create)

  before_action :set_guest, only: %i(show edit update destroy)

  def show
  end

  def new
    @guest = Guest.new
  end

  def create
    if (@guest = Guest.new(guest_params)).save
      session[:current_guest_id] = @guest.id
      redirect_to chats_url, notice: t('.welcome') and return
    end

    render :new
  end

  def edit
  end

  def update
    @guest.update(guest_params) && flash[:notice] = t('.updated')
  end

  def destroy
    @guest.destroy

    redirect_to root_url, notice: t('.destroyed')
  end

  private

  def set_guest
    @guest = Guest.find(params[:id])
  end

  def guest_params
    params[:guest].permit(:name)
  end
end

