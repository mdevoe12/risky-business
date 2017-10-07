class AddManageridToSupervisors < ActiveRecord::Migration[5.1]
  def change
    add_reference :supervisors, :manager, foreign_key: true
  end
end
