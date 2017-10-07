class AddCategoryidToFlras < ActiveRecord::Migration[5.1]
  def change
    add_reference :flras, :category, foreign_key: true
  end
end
