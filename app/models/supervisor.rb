class Supervisor < ApplicationRecord
  has_many :tasks
  has_many :workers, through: :tasks

  def workers_by_date(date)
    workers.joins(:tasks)
          .where("tasks.created_at = ?", date)
  end
end
