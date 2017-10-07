class CreateManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :managers do |t|
      t.string :first_name
      t.string :last_name
      t.references :site, foreign_key: true
      t.string :profile_picture

      t.timestamps
    end
  end
end
