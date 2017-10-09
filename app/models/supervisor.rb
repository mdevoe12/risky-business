class Supervisor < ApplicationRecord
  has_many :flras
  has_many :workers, through: :flras
  belongs_to :manager
  include Loginable

  def flra_score_counts
    flras.group("points").count
  end

  def workers_by_date(date)
    workers.joins(:flras)
          .where("flras.created_at = ?", date).distinct
  end

  def followup_flras
    flras.where("risk_differential > ?", 1)
  end
end
