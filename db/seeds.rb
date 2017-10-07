require 'csv'
start = Time.now

site = Site.create(name: "Salt Lake City", latitude: 40.758701, longitude: -111.876183)
manager = Manager.create(first_name: "James", last_name: "Daniels", site_id: site.id)
supervisor = Supervisor.create(first_name: "Jon", last_name: "Snow", manager_id: manager.id)

questions = ['What are you doing?', 'What could do go wrong?', 'How could it affect you?', 'How could it go wrong?']
questions.each do |question|
  Question.create(body: question)
end

Category.create(name: "Electrical")
Category.create(name: "Transportation")
Category.create(name: "Maintenance")

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
      :category_id => rand(1..3),
      :notes => Faker::Hipster.sentence,
      :follow_up_status => rand(1..2),
      :created_at => date,
      :updated_at => date
    )

    4.times do
      i = 1
      Response.create(
        :question_id => i,
        :body => Faker::Hipster.paragraph,
        :flra_id => flra.id,
        :created_at => date,
        :updated_at => date
      )
      i += 1
    end
  end

  20.times do
    date = (Date.today - rand(0..30).to_i.days)
    flra = Flra.create(
      :description => Faker::Hipster.sentence,
      :worker_id => worker.id,
      :supervisor_id => supervisor.id,
      :worker_risk_score => rand(1..7),
      :category_id => rand(1..3),
      :notes => Faker::Hipster.sentence,
      :follow_up_status => rand(1..2),
      :created_at => date,
      :updated_at => date
    )

    4.times do
      i = 1
      Response.create(
        :question_id => i,
        :body => Faker::Hipster.paragraph,
        :flra_id => flra.id,
        :created_at => date,
        :updated_at => date
      )
      i += 1
    end
  end
  puts "creating record #{counter}"
  counter += 1
end

puts "creation took #{Time.now - start}"
