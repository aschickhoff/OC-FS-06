class AddCommentsToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :comment, :text
  end
end
