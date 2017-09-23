class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :description
      t.references :worker, foreign_key: true
      t.references :supervisor, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
