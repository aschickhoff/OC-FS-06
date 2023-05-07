class Activity < ApplicationRecord
  belongs_to :activity_name
  belongs_to :user

  validates :activity_name_id, :date, :duration, presence: true
end
