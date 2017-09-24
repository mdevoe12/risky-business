class Supervisor < ApplicationRecord
  has_many :tasks
  has_many :workers, through: :tasks

  def task_score_counts
    
  end

  def workers_by_date(date)
    workers.joins(:tasks)
          .where("tasks.created_at = ?", date).distinct
  end
end
