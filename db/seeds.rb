# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.destroy_all
Category.destroy_all
Bid.destroy_all
Job.destroy_all

#Creating 20 fake users
user = User.new({
  first_name: "Roy",
  last_name: "van Arkel",
  description: "I'm a beginning aerial photographer",
  email: "royvanarkel@msn.com",
  password: "wachtwoord",
  owner: true,
  profile_pic: "v1458662374/alrcdlz61kscgbchsfgj.jpg",
  banner_pic: "v1458662375/htehjxqk66wc37gf66dz.jpg",
  location: "Katwijk"
  })
user.save!

Drone.create({
  brand: "Hubsan",
  model: "H107D",
  camera: "720p",
  photo: "v1457627823/qp7vymfuuz7mlxg2bpgz.jpg",
  user_id: user.id
  })

user1 = User.new({
  first_name: "Tom",
  last_name: "Stemerding",
  email: "tom@stemerdingmail.nl",
  password: "wachtwoord",
  owner: true,
  profile_pic: "v1458664478/luqi9z22mfwsppnvul0v.jpg",
  banner_pic: "v1458664521/xofwrclccr5yxbwyfywj.jpg",
  location: "Amsterdam"
  })

user1.save!

Drone.create({
  brand: "Apple",
  model: "iDrone",
  camera: "720p",
  photo: "v1457627400/u7pvpxntkmoveltvook4.png",
  user_id: user1.id
  })

user2 = User.new({
  first_name: "Iris",
  last_name: "Kramer",
  email: "ick.kramer@gmail.com",
  password: "wachtwoord",
  owner: true,
  profile_pic: "v1458915983/Iris_ocfcfx.jpg",
  location: "Ilpendam"
  })

user2.save!

d1 = Drone.create({
  brand: "DJI",
  model: "Phantom 4",
  camera: "4k",
  photo: "http://asset1.djicdn.com/uploads/product_store_photo/image/18141/large_p1.jpg",
  user_id: user2.id
  })

d2 = Drone.create({
  brand: "Hubsan",
  model: "x4",
  camera: "720p",
  photo: "https://www.toprc.nl/product_images/o/535/H107CPlus__47776_zoom.jpg",
  user_id: user2.id
  })

user3 = User.new({
  first_name: "Peter",
  last_name: "Jansen",
  email: "peter@jansen.com",
  password: "wachtwoord",
  owner: false
  })

user3.save!

job1 = Job.create({
  description: "I need some picture taken from the air while I am getting my sheep back inside",
  location: "Amsterdam",
  date: "Sat, 02 Apr 2016",
  user_id: user3.id,
  title: "Need a drone during a football match"
  })

Bid.create({
  bid_id: 1,
  description: "I'm the best for the job",
  job: job1,
  drone_id: d1
  })

job2 = Job.create({

  description: "I want to know how my property looks like from the air",
  location: "Amsterdam",
  date: "Mon, 23 Apr 2016",
  user: user3,
  title: "Property overview"
  })

job3 = Job.create({

  description: "I want a drone following me whole day, to a capture my work day",
  location: "Amsterdam",
  date: "Mon, 23 Mar 2016",
  user: user3,
  title: "Capture my day"
  })

user4 = User.new({
  first_name: "Harm",
  last_name: "Brandsma",
  email: "boerharm@hotmail.com",
  password: "wachtwoord",
  owner: false
  })
user4.save!


job4 = Job.create({

  description: "My crops needs to be inspected, has someone a drone that can do that?",
  location: "Amsterdam",
  date: "Mon, 04 Apr 2016",
  user: user4,
  title: "Farm inspection"
  })

job5 = Job.create({

  description: "I lost a sheep, can someone help me track it",
  location: "Amsterdam",
  date: "Fri, 01 Apr 2016",
  user: user4,
  title: "Sheep lost"
  })

education = Category.create({name: "education"})
environment = Category.create({name: "environment"})
family = Category.create({name: "family"})
festival = Category.create({name: "festival"})
fun = Category.create({name: "fun"})
other = Category.create({name: "other"})
sport = Category.create({name: "sport"})
wedding = Category.create({name: "wedding"})

JobCategory.create(job: job2, category: environment)
JobCategory.create(job: job2, category: other)
JobCategory.create(job: job2, category: education)
JobCategory.create(job: job1, category: fun)
JobCategory.create(job: job1, category: other)
JobCategory.create(job: job3, category: environment)
JobCategory.create(job: job3, category: fun)
JobCategory.create(job: job4, category: environment)
JobCategory.create(job: job4, category: other)
UserCategory.create(user: user, category:fun)
UserCategory.create(user: user, category:family)
UserCategory.create(user: user, category:other)
UserCategory.create(user: user, category:wedding)
UserCategory.create(user: user, category:education)
UserCategory.create(user: user1, category:fun)
UserCategory.create(user: user1, category:wedding)
UserCategory.create(user: user1, category:education)
UserCategory.create(user: user2, category:environment)
UserCategory.create(user: user2, category:festival)
UserCategory.create(user: user2, category:fun)
UserCategory.create(user: user2, category:wedding)
UserCategory.create(user: user2, category:education)


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

