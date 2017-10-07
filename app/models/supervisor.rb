class Supervisor < ApplicationRecord
  has_many :flras
  has_many :workers, through: :flras

  def flra_score_counts
    flras.group("points").count
  end

  def workers_by_date(date)
    date_range = [date.beginning_of_day..date.end_of_day]
    workers.joins(:flras)
          .where("flras.created_at > ? AND flras.created_at < ?", date.midnight, date.end_of_day).distinct
  end

  def followup_flras
    flras.where("risk_differential > ? OR points < ?", 1, 3)
  end

  def outstanding_flras
    flras.where(points: nil)
  end
end
