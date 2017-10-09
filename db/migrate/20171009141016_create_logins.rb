class CreateLogins < ActiveRecord::Migration[5.1]
  def change
    create_table :logins do |t|
      t.string :username
      t.string :password_digest
      t.string :role

      t.timestamps
    end
  end
end
