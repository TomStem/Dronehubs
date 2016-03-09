# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

#Creating 20 fake users

tom = User.new({
  first_name: "Tom",
  last_name: "Stemerding",
  email: "tom@stemerdingmail.nl",
  password: "stemerding",
  owner: true
  })
  tom.save!
  if !tom.owner
   Job.create({
   description: Faker::Lorem.paragraph,
   location: Faker::Address.city,
   date: Faker::Date.forward,
   user_id: user.id
  })
  end

20.times do 
  user = User.new({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: Faker::Internet.password,
  owner: Faker::Boolean.boolean
  })
  user.save!
  if !user.owner
   Job.create({
   description: Faker::Lorem.paragraph,
   location: Faker::Address.city,
   date: Faker::Date.forward,
   user_id: user.id
  })
  end
end