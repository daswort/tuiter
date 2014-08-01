namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Jacob Vidal",
                 email: "firstcommand@gmail.com",
                 password: "tragedia",
                 password_confirmation: "tragedia",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "user-#{n+1}@gmail.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end