class AddColumnsToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, worker_risk_score, :integer
    add_column :tasks, super_risk_score, :integer
    add_column :tasks, risk_differential, :integer
  end
end
