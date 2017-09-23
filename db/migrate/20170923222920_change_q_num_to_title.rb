class ChangeQNumToTitle < ActiveRecord::Migration[5.1]
  def change
    remove_column :responses, :question_num

    add_column :responses, :question_title, :string
  end
end
