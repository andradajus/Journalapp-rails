class RenameAdminToAdminStatus < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :admin, :admin_status
       change_column :users, :admin_status, :boolean, default: false
  end
end
