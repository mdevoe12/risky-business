class AddNotesToFlras < ActiveRecord::Migration[5.1]
  def change
    add_column :flras, :notes, :text
  end
end
