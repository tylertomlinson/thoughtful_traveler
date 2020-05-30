class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true

  belongs_to :place
end
