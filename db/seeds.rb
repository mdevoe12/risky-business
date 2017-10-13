require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

require 'csv'
start = Time.now

site = Site.create(name: "Salt Lake City", latitude: 40.758701, longitude: -111.876183)
manager = Manager.create!(first_name: "James", last_name: "Daniels", site_id: site.id)
Login.create(username: "james123", password: "password", loginable_id: manager.id, loginable_type: "Manager")
supervisor = Supervisor.create(first_name: "Jon", last_name: "Snow", manager_id: manager.id)
Login.create(username: "jon123", password: "password", loginable_id: supervisor.id, loginable_type: "Supervisor")



questions = ['What are you doing?', 'What could do go wrong?', 'How could it affect you?', 'How could it go wrong?']
questions.each do |question|
  Question.create(body: question)
end

electrical = Category.create(name: "Electrical")
transportation = Category.create(name: "Transportation")
elec_controls = ["Lock Out/Tag Out", "Check for Locks"]
elec_controls.each do |body|
  Control.create!(category_id: electrical.id, body: body)
end
TopRisk.create(category_id: electrical.id, body: "Check Grounding")

trans_controls = ["Pre-start Check", "Seatbelts", "Tires", "Horn", "Head Lights"]
trans_controls.each do |body|
  Control.create(category_id: transportation.id, body: body)
end
TopRisk.create(category_id: transportation.id, body: "Load Secured?")

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
      :follow_up_status => rand(1..2)
    )

    4.times do |i|
      Response.create(
        :question_id => i + 1,
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
      :category_id => rand(1..3),
      :notes => Faker::Hipster.sentence,
      :follow_up_status => rand(1..2),
      :created_at => date,
      :updated_at => date
    )

    4.times do |i|
      Response.create(
        :question_id => i + 1,
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
