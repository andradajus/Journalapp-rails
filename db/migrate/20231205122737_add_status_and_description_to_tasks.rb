class AddStatusAndDescriptionToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :status, :string
    add_column :tasks, :description, :text
  end
end
