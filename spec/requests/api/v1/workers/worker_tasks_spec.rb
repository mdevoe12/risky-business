require 'rails_helper'

describe "worker tasks api" do
  it "receives input from worker form" do
    worker = Worker.create(first_name: "first", last_name: "last")
    supervisor = Supervisor.create(first_name: "super f", last_name: "super l")

    input = {worker_id: "#{worker.id}",
             supervisor_id: "#{supervisor.id}",
             task_description: "replace pipes",
             questions: {
               "1": "replacing a1-a3 pipes in sector v",
               "2": "hazardous chemical spill",
               "3": "severe chemical burns",
               "4": "ensure protective gear correctly worn"
                        }}

    post "/api/v1/workers/tasks", params: input

    task = Task.last

    expect(response).to be_success
    expect(Task.count).to eq(1)
    expect(task.description).to eq("replace pipes")
    expect(task.worker.id).to eq(worker.id)
    expect(task.supervisor.id).to eq(supervisor.id)
    expect(task.points).to eq(nil)
    expect(task.responses.count).to eq(4)
    expect(task.responses.first.body).to eq("replacing a1-a3 pipes in sector v")
    expect(task.responses.last.body).to eq("ensure protective gear correctly worn")

  end
end
