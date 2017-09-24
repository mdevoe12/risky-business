class Supervisor < ApplicationRecord
  has_many :tasks
  has_many :workers, through: :tasks

  def task_score_counts
    tasks.group("points").count
  end

  def workers_by_date(date)
    workers.joins(:tasks)
          .where("tasks.created_at = ?", date).distinct
  end

  def followup_tasks
    tasks.where("risk_differential > ?", 1)
  end
end
