class RemoveNameFromActivities < ActiveRecord::Migration[7.0]
  def change
    remove_column :activities, :name, :string
  end
end
