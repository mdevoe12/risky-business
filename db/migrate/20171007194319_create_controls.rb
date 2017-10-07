class CreateControls < ActiveRecord::Migration[5.1]
  def change
    create_table :controls do |t|
      t.string :body
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
