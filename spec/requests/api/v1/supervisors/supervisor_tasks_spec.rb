require 'rails_helper'

describe 'Supervisor tasks API' do
  it "can pull tasks for a supervisor separated by worker" do

  end

  it "returns the number of tasks in each result category" do
    supervisor = create(:supervisor)
    create_list(:task, 4, supervisor: supervisor, points: 5)
    create_list(:task, 3, supervisor: supervisor, points: 3)
    create_list(:task, 2, supervisor: supervisor, points: 2)
    create_list(:task, 1, supervisor: supervisor, points: 1)

    get "/api/v1/supervisors/#{supervisor.id}/task_scores"

    expect(response).to be_success

    expect(response.first["5"]).to eq("4")
    expect(response.first["3"]).to eq("3")
    expect(response.first["2"]).to eq("2")
    expect(response.first["1"]).to eq("1")
  end
end
