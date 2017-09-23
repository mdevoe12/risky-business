class AddImageToWorkers < ActiveRecord::Migration[5.1]
  def change
    add_column :workers, :image, :string
  end
end
