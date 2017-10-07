require 'csv'
start = Time.now

supervisor = Supervisor.create(first_name: "Jon", last_name: "Snow")

questions = ['What are you doing?', 'What could do go wrong?', 'How could it affect you?', 'How could it go wrong?']

counter = 1

file = File.read('db/csv/player_images.csv')
persons = CSV.parse(file)

30.times do
  random_person = persons.sample
  worker = Worker.create(
    :first_name => random_person[0].split(' ')[0],
    :last_name => random_person[0].split(' ')[1]
  )

  20.times do
    date = (Date.today - rand(0..30).to_i.days)
    flra = Flra.create(
      :description => Faker::Hipster.sentence,
      :worker_id => worker.id,
      :supervisor_id => supervisor.id,
      :points => rand(1..5),
      :worker_risk_score => rand(1..7),
      :created_at => date,
      :updated_at => date
    )

    questions.each do |question|
      Response.create(
        :question_title => question,
        :body => Faker::Hipster.paragraph,
        :flra_id => flra.id,
        :created_at => date,
        :updated_at => date
      )
    end
  end

  20.times do
    date = (Date.today - rand(0..30).to_i.days)
    flra = Flra.create(
      :description => Faker::Hipster.sentence,
      :worker_id => worker.id,
      :supervisor_id => supervisor.id,
      :worker_risk_score => rand(1..7),
      :created_at => date,
      :updated_at => date
    )

    questions.each do |question|
      Response.create(
        :question_title => question,
        :body => Faker::Hipster.paragraph,
        :flra_id => flra.id,
        :created_at => date,
        :updated_at => date
      )
    end
  end
  puts "creating record #{counter}"
  counter += 1
end

puts "creation took #{Time.now - start}"
