class FlraSerializer < ActiveModel::Serializer
  attributes :id, :description, :worker_id, :supervisor_id, :points,
             :created_at, :updated_at, :worker_risk_score, :super_risk_score,
             :risk_differential, :category_id, :notes, :follow_up_status

  belongs_to :worker
  belongs_to :category

end
