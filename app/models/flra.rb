class Flra < ApplicationRecord
  belongs_to :worker
  belongs_to :supervisor
  belongs_to :category
  has_many :responses

  enum follow_up_status: [:not_flagged, :flagged, :resolved]

  def self.most_recent
    Flra.all.order("created_at DESC").limit(5)
  end

  def calc_diff
    differential = (super_risk_score - worker_risk_score).abs
    self.update(risk_differential: differential)
  end

  def update_status
    self.update(follow_up_status: 1) if (risk_differential > 1 || points < 3)
  end
end
