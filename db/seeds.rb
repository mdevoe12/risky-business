require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

require 'csv'
start = Time.now

risks = ["Dehydration", "Slipping in puddle", "Cuts from Broken Glass", "Dust Inhalation or Dust in Eyes",
        "Falling Off Ladder", "Fall from Scaffold Platform", "Hypothermia"]

go_wrongs = ["I could fall off a ladder and break my leg.",
             "My coworkers and I could be electrocuted by the portal wires.",
             "Harmful gases could be released by the generator. The gases could be harmful to workers and others around the mine."]

safety_checks = ["I will make sure I wear a helmet.",
                "I will make sure my coworkers and I wear protective clothing.",
                "I will make sure I bring enough water to keep myself hyrdated."]

site = Site.create(name: "Salt Lake City", latitude: 40.758701, longitude: -111.876183)
manager = Manager.create!(first_name: "James", last_name: "Daniels", site_id: site.id)
Login.create(username: "manager", password: "password", loginable_id: manager.id, loginable_type: "Manager")
4.times do
  Supervisor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, manager_id: manager.id)
end
login_supervisor = Supervisor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, manager_id: manager.id)
Login.create(username: "supervisor", password: "password", loginable_id: login_supervisor.id, loginable_type: "Supervisor")

questions = ['What are you doing?', 'What are the risks?', 'What could go wrong?', 'What are your safety checks?']
questions.each do |question|
  Question.create(body: question)
end

electrical = Category.create(name: "Electrical")
transportation = Category.create(name: "Transportation")
maintenance = Category.create(name: "Maintenance")

elec_controls = ["Lock Out/Tag Out", "Check for Locks"]
elec_controls.each do |body|
  Control.create!(category_id: electrical.id, body: body)
end
TopRisk.create(category_id: electrical.id, body: "Electrocution")
TopRisk.create(category_id: electrical.id, body: "Falling From Ladder")

trans_controls = ["Pre-start Check", "Seatbelts", "Tires", "Horn", "Head Lights"]
trans_controls.each do |body|
  Control.create(category_id: transportation.id, body: body)
end
TopRisk.create(category_id: transportation.id, body: "Falling off Vehicle")
TopRisk.create(category_id: transportation.id, body: "Electrical Shock")

Control.create(category_id: maintenance.id, body: "Wear Helmet")
Control.create(category_id: maintenance.id, body: "Bring First Aid Kit")
TopRisk.create(category_id: maintenance.id, body: risks.sample)

counter = 1

pictures = ["profile_pic_1.jpg",
            "profile_pic_2.jpg",
            "profile_pic_3.jpg"]


tasks = ["replace electrical lines in mine",
      "install panels on building A",
      "replace pipes in generators"]

notes = ["discussion took place and action plan for improvement formulated",
          "This form should have been completed in more detail. I discussed the issue with the worker."]

responses = [""]

dan = Worker.create(first_name: "Dan", last_name: "Alvarez", image: "dan.jpg")

15.times do |n|
  if n == 0
    worker = dan
    supervisor = login_supervisor
  else
    supervisor = Supervisor.all.sample
    worker = Worker.create(
      :first_name => Faker::Name.first_name[0...7],
      :last_name => Faker::Name.last_name[0...6],
      :image => pictures.sample
    )
  end

  3.times do
    worker_risk = rand(1..7)
    super_risk = rand(1..7)
    date = (Date.today - rand(0..30).to_i.days)
    flra = Flra.create!(
      :description => tasks.sample,
      :worker_id => worker.id,
      :supervisor_id => supervisor.id,
      :points => nil,
      :worker_risk_score => worker_risk,
      :super_risk_score => nil,
      :risk_differential => nil,
      :category_id => Category.all.sample.id,
      :notes => "",
      :follow_up_status => 0,
    )

    Response.create(:question_id => 1, :body => tasks.sample, :flra_id => flra.id, :created_at => date, :updated_at => date)
    Response.create(:question_id => 2, :body => risks.sample, :flra_id => flra.id, :created_at => date, :updated_at => date)
    Response.create(:question_id => 3, :body => go_wrongs.sample, :flra_id => flra.id, :created_at => date, :updated_at => date)
    Response.create(:question_id => 4, :body => safety_checks.sample, :flra_id => flra.id, :created_at => date, :updated_at => date)
  end

  3.times do
    worker_risk = rand(1..7)
    super_risk = rand(1..7)
    date = (Date.today - rand(0..30).to_i.days)
    flra = Flra.create!(
      :description => tasks.sample,
      :worker_id => worker.id,
      :supervisor_id => supervisor.id,
      :points => rand(1..5),
      :worker_risk_score => worker_risk,
      :super_risk_score => super_risk,
      :risk_differential => (super_risk - worker_risk).abs,
      :category_id => Category.all.sample.id,
      :notes => notes.sample,
      :follow_up_status => 1,
    )

    Response.create(:question_id => 1, :body => tasks.sample, :flra_id => flra.id, :created_at => date, :updated_at => date)
    Response.create(:question_id => 2, :body => risks.sample, :flra_id => flra.id, :created_at => date, :updated_at => date)
    Response.create(:question_id => 3, :body => go_wrongs.sample, :flra_id => flra.id, :created_at => date, :updated_at => date)
    Response.create(:question_id => 4, :body => safety_checks.sample, :flra_id => flra.id, :created_at => date, :updated_at => date)
  end

  3.times do
    worker_risk = rand(1..7)
    super_risk = rand(1..7)
    date = (Date.today - rand(0..30).to_i.days)
    flra = Flra.create(
      :description => tasks.sample,
      :worker_id => worker.id,
      :supervisor_id => supervisor.id,
      :points => rand(1..5),
      :worker_risk_score => worker_risk,
      :category_id => rand(1..3),
      :notes => notes.sample,
      :follow_up_status => 2,
      :created_at => date,
      :updated_at => date
    )


    Response.create(:question_id => 1, :body => tasks.sample, :flra_id => flra.id, :created_at => date, :updated_at => date)
    Response.create(:question_id => 2, :body => risks.sample, :flra_id => flra.id, :created_at => date, :updated_at => date)
    Response.create(:question_id => 3, :body => go_wrongs.sample, :flra_id => flra.id, :created_at => date, :updated_at => date)
    Response.create(:question_id => 4, :body => safety_checks.sample, :flra_id => flra.id, :created_at => date, :updated_at => date)

  end
  puts "creating record #{counter}"
  counter += 1
end

puts "creation took #{Time.now - start}"
