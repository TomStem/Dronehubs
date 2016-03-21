# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

#Creating 20 fake users

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

education = Category.new({
  name: "education"
  })
environment = Category.new({
  name: "environment"
  })
family = Category.new({
  name: "family"
  })
festival = Category.new({
  name: "festival"
  })
fun = Category.new({
  name: "fun"
  })
other = Category.new({
  name: "other"
  })
sport = Category.new({
  name: "sport"
  })
wedding = Category.new({
  name: "wedding"
  })

# User.create({
#   user_id: 1,
#   first_name: "Iris",
#   last_name: "Kramer",
#   email: "irisemail@email.com",
#   password: "somepassword",
#   owner: false
#   })

# User.create({
#   user_id: 2,
#   first_name: "Iris",
#   last_name: "Kramer",
#   email: "irisemail@email.com",
#   password: "somepassword",
#   owner: true
#   })

# Job.create({
#   job_id: 1,
#   description: "I would like a video of the local football match",
#   location: "Volendam",
#   date: "Wed, 24 Sep 2016",
#   user_id: 1
#   })

# Drone.create({
#   drone_id: 1,
#   brand: "GoPro",
#   model: "HeroDrone",
#   camera: "GoPro 1",
#   user_id: 2,
#   photo: ""
#   })

# Bid.create({
#   bid_id: 1,
#   description: "I'm the best for the job",
#   job_id: 1,
#   drone_id: 1
#   })

