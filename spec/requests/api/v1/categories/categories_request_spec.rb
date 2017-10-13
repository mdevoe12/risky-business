require 'rails_helper'

describe 'Categories APIs' do
  describe 'Category Risks API' do
    it "returns the risks for a category" do
      category = create(:category)
      top_risks = create_list(:top_risk, 3, category: category)

      get "/api/v1/categories/#{category.id}/risks"

      expect(response).to be_success
      risks = JSON.parse(response.body)

      expect(risks.count).to eq(3)
      expect(risks.first["body"]).to eq(top_risks[0].body)
    end
  end
end
