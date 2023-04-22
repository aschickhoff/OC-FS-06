class AddActivityNameIdToActivities < ActiveRecord::Migration[6.1]
  def change
    add_reference :activities, :activity_name, null: false, foreign_key: true, default: 1
  end
end
