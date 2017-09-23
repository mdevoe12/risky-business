class CreateQuestionResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :question_responses do |t|
      t.text :body
      t.references :question, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
