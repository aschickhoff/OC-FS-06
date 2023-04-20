class ActivityName < ApplicationRecord
  # relation between activities and users
  has_many :activities
end
