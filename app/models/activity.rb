class Activity < ApplicationRecord
  # relation between activities and users
  belongs_to :user

  # relation between activities and activity name
  belongs_to :activity_name
end
