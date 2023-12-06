class AddCategoryToReminders < ActiveRecord::Migration[7.1]
  def change
    add_column :reminders, :category, :string
  end
end
