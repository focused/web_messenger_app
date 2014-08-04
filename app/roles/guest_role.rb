class GuestRole < ModelDecorator
  extend CallableValue

  alias :authenticated? :persisted?

  def name
    super || I18n.t('guests.unnamed')
  end

  def status
    # TODO: show guest status
    # '(%s)' % I18n.t('guests.statuses.default')
  end
end
