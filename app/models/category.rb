class Category < ApplicationRecord
  has_many :flras
  has_many :controls
  has_many :top_risks

  def recent_risk_responses
    Question.second
            .responses
            .joins(:flra)
            .where("flras.category_id = ?", id)
            .order("created_at DESC")
            .limit(20)
  end
end
