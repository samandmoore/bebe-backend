class Kid < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :diaper_events

  validates :name, presence: true
  validates :date_of_birth, presence: true
end
