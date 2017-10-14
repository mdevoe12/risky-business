class Flra < ApplicationRecord
  belongs_to :worker
  belongs_to :supervisor
  belongs_to :category
  has_many :responses
  has_many :questions, through: :responses

  enum follow_up_status: [:not_flagged, :flagged, :resolved]

  before_save :update_followup_status

  def self.most_recent
    Flra.all.order("created_at DESC").limit(5)
  end

  def calc_diff
    if super_risk_score
      differential = (super_risk_score - worker_risk_score).abs
      self.risk_differential = differential
    end
  end

  def update_followup_status
    calc_diff
    if (super_risk_score && self.not_flagged? && (risk_differential > 1 || points < 3))
      self.follow_up_status = 1
    end
  end
end
