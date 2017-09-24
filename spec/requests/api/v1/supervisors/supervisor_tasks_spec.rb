require 'rails_helper'

describe 'Supervisor tasks API' do
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
