class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :username
      t.string :email
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :birthday
      t.string :country
      t.string :password_digest

      t.timestamps
    end
  end
end
