class Supervisor < ApplicationRecord
  has_many :flras
  has_many :workers, through: :flras
  belongs_to :manager
  has_many :logins, :as => :loginable


  def flra_score_counts
    flras.group("points").count
  end

  def workers_by_date(date)
    date_range = [date.beginning_of_day..date.end_of_day]
    workers.joins(:flras)
          .where("flras.created_at > ? AND flras.created_at < ?", date.midnight, date.end_of_day).distinct
  end

  def followup_flras
    flras
      .includes(:category, :worker)
      .where("follow_up_status = ?", 1)
      .order(created_at: :desc)
  end

  def outstanding_flras
    flras
      .includes(:responses, :questions, :worker)
      .where(points: nil)
      .order(created_at: :desc)
  end

  def outstanding_flras_for_worker(worker)
    flras.where(points: nil).where(worker: worker)
  end

  def form_counts
    {forms: outstanding_flras.count, followups: followup_flras.count}
  end
end
