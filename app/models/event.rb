class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
end
