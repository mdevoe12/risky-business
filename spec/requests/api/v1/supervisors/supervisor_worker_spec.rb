require 'rails_helper'

describe 'Supervisor workers API' do
  it "returns a supervisors workers by day" do
    supervisor_1 = create(:supervisor)
    supervisor_2 = create(:supervisor)
    w1, w2, w3, w4 = create_list(:worker, 4)
    today = Date.new(2017, 5, 12)
    yesterday = Date.new(2017, 5, 11)
    create(:task, worker: w1, supervisor: supervisor_1, created_at: yesterday)
    create(:task, worker: w2, supervisor: supervisor_1, created_at: today)
    create(:task, worker: w3, supervisor: supervisor_2, created_at: today)
    create(:task, worker: w4, supervisor: supervisor_1, created_at: today)

    get "/api/v1/supervisors/#{supervisor_1.id}/workers?date=2017-05-12"
    expect(response).to be_success
    workers = JSON.parse(response.body)
    expect(workers.count).to eq(2)
    expect(workers.first["first_name"]).to eq(w2.first_name)
    expect(workers.second["first_name"]).to eq(w4.first_name)
    expect(workers.first["last_name"]).to eq(w4.last_name)
    expect(workers.second["last_name"]).to eq(w4.last_name)
  end
end
