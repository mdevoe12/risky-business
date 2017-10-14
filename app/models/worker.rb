class Worker < ApplicationRecord
  has_many :flras

  def flras_by_date(date)
    flras.where(created_at: (date.beginning_of_day..date.end_of_day))
  end

  def average_form_score
    flras.average(:points).round(2)
  end

  def outstanding_flras(super_id)
    flras
      .includes(:questions, :responses)
      .where(points: nil, supervisor_id: super_id)
      .order(created_at: :desc)
  end

  def forms_to_follow_up(super_id)
    flras.includes(:category).where(follow_up_status: 1, supervisor_id: super_id)
  end

  def flra_score_counts
    flras.group("points").count
  end

  def form_counts(super_id)
    {forms: outstanding_flras(super_id).count, followups: forms_to_follow_up(super_id).count}
  end
end
