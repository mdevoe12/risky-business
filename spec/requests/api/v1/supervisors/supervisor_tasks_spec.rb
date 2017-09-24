require 'rails_helper'

describe 'Supervisor tasks API' do

  it "returns the number of tasks in each result category" do
    supervisor = create(:supervisor)
    create_list(:task, 4, supervisor: supervisor, points: 5)
    create_list(:task, 3, supervisor: supervisor, points: 3)
    create_list(:task, 2, supervisor: supervisor, points: 2)
    create_list(:task, 1, supervisor: supervisor, points: 1)

    get "/api/v1/supervisors/#{supervisor.id}/task_scores"

    expect(response).to be_success
    counts = JSON.parse(response.body)

    expect(counts["1"]).to eq(1)
    expect(counts["2"]).to eq(2)
    expect(counts["3"]).to eq(3)
    expect(counts["5"]).to eq(4)
  end

  it "can pull tasks for a supervisor separated by worker" do
    workers = create_list(:worker, 3)
    worker = workers.first

    workers.each do |worker|
      worker.tasks << create_list(:task, 3, :with_responses)
      worker.tasks << create(:task, :with_responses, created_at: 1.week.ago)
    end

    get "/api/v1/supervisors/tasks/#{worker.id}", params: {date: worker.tasks.first.created_at}

    expect(response).to be_success

    result = JSON.parse(response.body)

    task = result.first
    responses = task['responses']

    expect(result.count).to eq 3
    expect(task).to have_key 'description'
    expect(task).to have_key 'responses'
    expect(responses.count).to eq 4
    expect(responses.first).to have_key 'body'
  end

  it "can update the score of a task" do
    task = create(:task, :with_responses)

    put "/api/v1/supervisors/tasks/#{task.id}", params: {points: 5}

    expect(Task.find(task.id).points).to eq 5
  end
end
