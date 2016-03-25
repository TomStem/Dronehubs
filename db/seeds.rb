# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

#Creating 20 fake users
  user = User.new({
  first_name: "Roy",
  last_name: "van Arkel",
  description: "I'm a beginning aerial photographer",
  email: "royvanarkel@msn.com",
  password: "wachtwoord",
  owner: true,
  profile_pic: "v1458662374/alrcdlz61kscgbchsfgj.jpg",
  banner_pic: "v1458662375/htehjxqk66wc37gf66dz.jpg"
  })
  user.save!

  Drone.create({
    brand: "Hubsan",
    model: "H107D"
    camera: "720p"
    photo: "v1457627823/qp7vymfuuz7mlxg2bpgz.jpg"
    user_id: user.id
    })

  user1 = User.new({
  first_name: "Tom",
  last_name: "Stemerding",
  description: "",
  email: "tom@stemerdingmail.nl",
  password: "wachtwoord",
  owner: true,
  profile_pic: "v1458664478/luqi9z22mfwsppnvul0v.jpg",
  banner_pic: "v1458664521/xofwrclccr5yxbwyfywj.jpg"
  })

  user1.save!

  Drone.create({
    brand: "Apple",
    model: "iDrone"
    camera: "720p"
    photo: "v1457627400/u7pvpxntkmoveltvook4.png"
    user_id: user1.id
    })

  if !user.owner
   Job.create({
   description: Faker::Lorem.paragraph,
   location: Faker::Address.city,
   date: Faker::Date.forward,
   user_id: user.id,
   title: Faker::Lorem.sentence
  })
  end
end

Category.create({name: "education"})
Category.create({name: "environment"})
Category.create({name: "family"})
Category.create({name: "festival"})
Category.create({name: "fun"})
Category.create({name: "other"})
Category.create({name: "sport"})
Category.create({name: "wedding"})

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

