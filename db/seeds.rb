supervisor = Supervisor.create(first_name: "Jon", last_name: "Snow")

30.times do
  worker = Worker.create(
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name
  )

  100.times do
    task = Task.create(
      :worker_id => worker.id,
      :supervisor_id => supervisor.id,
      :points => rand(1..5),
      :updated_at => { Date.today - Faker::Number.number(rand(1..30).to_i.days }
    )

    4.times do |n|
      Response.create(
        :question_num => n
        :body => Faker::Hipster.paragraph,
        :task_id => task.id
      )
    end
  end
end
