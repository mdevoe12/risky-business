class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.text :body
      t.integer :question_num
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
