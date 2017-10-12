class Worker < ApplicationRecord
  has_many :flras

  def flras_by_date(date)
    flras.where(created_at: (date.beginning_of_day..date.end_of_day))
  end

  def average_form_score
    flras.average(:points)
  end

  def forms_to_follow_up
    flras.where('follow_up_status = ?', 1)
  end
end
