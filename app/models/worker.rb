class Worker < ApplicationRecord
  has_many :tasks

  def tasks_by_date(date)
    tasks.where(created_at: (date.beginning_of_day..date.end_of_day))
  end
end
