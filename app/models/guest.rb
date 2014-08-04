# TODO: change storage (maybe Redis?)

class Guest < ActiveRecord::Base
  validates :name, presence: true, length: 2..255, uniqueness: true
end
