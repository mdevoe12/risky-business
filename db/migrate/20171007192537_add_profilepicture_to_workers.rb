class AddProfilepictureToWorkers < ActiveRecord::Migration[5.1]
  def change
    add_column :workers, :profile_picture, :string
  end
end
