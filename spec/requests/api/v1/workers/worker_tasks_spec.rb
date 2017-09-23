require 'rails_helper'

describe "worker tasks api" do
  it "receives input from worker form" do
    worker = Worker.create(first_name: "first", last_name: "last")
    supervisor = Supervisor.create(first_name: "super f", last_name: "super l")

    input = {worker_id: "#{worker.id}",
             supervisor_id: "#{supervisor.id}",
             task_description: "replace pipes",
             questions: {
               1: "replacing a1-a3 pipes in sector v",
               2: "hazardous chemical spill",
               3: "severe chemical burns",
               4: "ensure protective gear correctly worn"
                        }}

    post "/api/v1/workers/tasks", input

    # rack_test_session_wrapper = Capybara.current_session.driver
    # rack_test_session_wrapper.post("/api/v1/workers/tasks",
    # params =  {worker_id: "#{workder.id}",
    #          supervisor_id: "#{supervisor.id}",
    #          task_description: "replace pipes",
    #          questions: {
    #            1: "replacing a1-a3 pipes in sector v",
    #            2: "hazardous chemical spill",
    #            3: "severe chemical burns",
    #            4: "ensure protective gear correctly worn"
    #                     }}

    result = JSON.parse(response.body)
    
    expect(result.worker_id).to eq(worker.id)

  end
end
