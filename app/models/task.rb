class Task < ApplicationRecord
  belongs_to :worker
  belongs_to :supervisor
  has_many :responses

  def self.most_recent
    Task.all.order("created_at DESC").limit(5)
  end

  def calc_diff
    differential = (super_risk_score - worker_risk_score).abs
    self.update(risk_differential: differential)
  end
end
