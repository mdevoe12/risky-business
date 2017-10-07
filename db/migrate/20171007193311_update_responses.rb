class UpdateResponses < ActiveRecord::Migration[5.1]
  def change
    remove_column :responses, :task_id
    remove_column :responses, :question_title

    add_reference :responses, :flra, foreign_key: true
    add_reference :responses, :question, foreign_key: true
  end
end
