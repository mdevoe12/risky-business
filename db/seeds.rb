require 'csv'
start = Time.now

supervisor = Supervisor.create(first_name: "Jon", last_name: "Snow")

counter = 1

file = File.read('db/csv/player_images.csv')
persons = CSV.parse(file)

30.times do
  random_person = persons.sample
  worker = Worker.create(
    :first_name => random_person[0].split(' ')[0],
    :last_name => random_person[0].split(' ')[1],
    :image => random_person[1]
  )

  100.times do
    date = (Date.today - rand(0..30).to_i.days)
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
