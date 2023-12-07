class AddNotNullConstraintToTasksUserId < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tasks, :user_id, false
  end
end
