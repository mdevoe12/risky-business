start = Time.now

supervisor = Supervisor.create(first_name: "Jon", last_name: "Snow")

counter = 1

30.times do
  worker = Worker.create(
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name
  )

  100.times do
    date = (Date.today - rand(1..30).to_i.days)
    task = Task.create(
      :description => Faker::Hipster.sentence,
      :worker_id => worker.id,
      :supervisor_id => supervisor.id,
      :points => rand(1..5),
      :created_at => date,
      :updated_at => date
    )

    6.times do |n|
      Response.create(
        :question_title => Faker::Hipster.sentence,
        :body => Faker::Hipster.paragraph,
        :task_id => task.id,
        :created_at => date,
        :updated_at => date
      )
    end
  end
  puts "creating record #{counter}"
  counter += 1
end

puts "creation took #{Time.now - start}"
