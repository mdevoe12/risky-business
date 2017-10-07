class Worker < ApplicationRecord
  has_many :flras

  def tasks_by_date(date)
    tasks.where(created_at: (date.beginning_of_day..date.end_of_day))
  end

  def average_form_score
    tasks.average(:points)
  end
end
