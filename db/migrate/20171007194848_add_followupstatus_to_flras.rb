class AddFollowupstatusToFlras < ActiveRecord::Migration[5.1]
  def change
    add_column :flras, :follow_up_status, :integer
  end
end
