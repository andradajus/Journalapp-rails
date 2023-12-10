class RenameAdminToAdminStatus < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :admin, :admin_status
  end
end
