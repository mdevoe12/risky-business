require 'rails_helper'

RSpec.describe Worker, type: :model do
  context 'instance methods' do
    it '#average_form_score' do
      worker = create(:worker)

      worker.tasks << create_list(:task, 3, points: 3)
      worker.tasks << create_list(:task, 3, points: 5)

      result = worker.average_form_score

      expect(result).to eq 4
    end
  end
end
