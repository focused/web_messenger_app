# TODO: change storage (maybe Redis?)

class Guest < ActiveRecord::Base
  before_validation do
    self.name.strip!
  end

  scope :except_one, -> person do
    all.where.not(id: person.id)
  end

  validates :name, {
    presence: true,
    length: 2..255,
    uniqueness: true
  }
end
