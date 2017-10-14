require 'rails_helper'

RSpec.describe Category, type: :model do
  context "instance methods" do
    it "#recent_risk_responses returns list of recent risks" do
      q1 = Question.first
      q2 = Question.second
      category = create(:category)
      flra1 = create(:flra, category: category)
      flra2 = create(:flra, category: category)
      response1 = create(:response, flra: flra1, question: q1)
      response2 = create(:response, flra: flra1, question: q2)
      response3 = create(:response, flra: flra1, question: q2)
      response4 = create(:response, flra: flra2, question: q2)
      expect(category.recent_risk_responses).to eq([response2, response3, response4])
    end
  end
end
