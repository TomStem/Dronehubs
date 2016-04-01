# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

puts "cleaning db..."

User.destroy_all
Category.destroy_all
Bid.destroy_all
Job.destroy_all

########################################

puts "creating pilots..."

# ROY

roy = User.new({
  first_name: "Roy",
  last_name: "van Arkel",
  description: "I'm a beginning aerial photographer",
  email: "royvanarkel@msn.com",
  password: "wachtwoord",
  owner: true,
  location: "Katwijk"
  })
roy[:profile_pic] = "v1458662374/alrcdlz61kscgbchsfgj.jpg"
roy[:banner_pic] = "v1458662375/htehjxqk66wc37gf66dz.jpg"
roy.save!

roy_drone = Drone.new({
  brand: "Hubsan",
  model: "H107D",
  camera: "720p",
  user: roy
})

roy_drone[:photo] = "v1459500057/oudkgcnlhatmixz33qjj.jpg"
roy_drone.save!

########################################

# TOM

tom = User.new({
  first_name: "Tom",
  last_name: "Stemerding",
  email: "tom@stemerdingmail.nl",
  password: "wachtwoord",
  owner: true,
  location: "Amsterdam"
  })

tom[:profile_pic] = "v1459349729/rs8ykgrrzrykcjnjimdf.jpg"
tom[:banner_pic] = "v1459349730/c5r4baglse4iq3f224tk.jpg"
tom.save!

tom_drone = Drone.new({
  brand: "Apple",
  model: "iDrone",
  camera: "720p",
  user: tom
})
tom_drone[:photo] = "v1459495152/hjlphode4ebpjvmfomjx.jpg"
tom_drone.save!

########################################

# IRIS

iris = User.new({
  first_name: "Iris",
  last_name: "Kramer",
  email: "ick.kramer@gmail.com",
  password: "wachtwoord",
  owner: true,
  location: "Ilpendam"
  })
iris[:profile_pic] = "v1459436713/szymrug7ntwrjtjyhaed.jpg"
iris[:banner_pic] = "v1459513566/082813_1044_DronesInArc1_y5lfna.jpg" 
iris.save!

iris_drone1 = Drone.new({
  brand: "eBee",
  model: "Fixed wing",
  camera: "Multispec 4c",
  user: iris
})
iris_drone1[:photo] = "v1459513283/multispectraldrone_lzx3oo.jpg"
iris_drone1.save!

iris_drone2 = Drone.new({
  brand: "Hubsan",
  model: "x4",
  camera: "720p",
  user: iris
})
iris_drone2[:photo] = "v1459500057/oudkgcnlhatmixz33qjj.jpg"
iris_drone2.save!

########################################


puts "creating clients & jobs..."

# PETER

client_peter = User.new({
  first_name: "Peter",
  last_name: "Jansen",
  email: "peter@jansen.com",
  password: "wachtwoord",
  owner: false
})
client_peter[:profile_pic] = "v1459418428/pnblt5bsvtkeuvgh0i8x.jpg"
client_peter[:banner_pic] = "v1459418366/bma5tt1kgoknbcabnlbs.jpg"
client_peter.save!

peter_job_farm = Job.create!({
  description: "I need some picture taken from the air while I am getting my sheep back inside",
  location: "Amsterdam",
  date: "Sat, 02 Apr 2016",
  user: client_peter,
  title: "Need a drone at my farm"
})

Bid.create!({
  job: peter_job_farm,
  drone: tom_drone,
  amount: 55,
  description: "I'm the best for the job"
})

Bid.create!({
  job: peter_job_farm,
  drone: roy_drone,
  amount: 35,
  description: "I'm available for this job",
})

peter_job_property = Job.create!({
  description: "I want to know how my property looks like from the air",
  location: "Amsterdam",
  date: "Mon, 23 Apr 2016",
  user: client_peter,
  title: "Property overview"
})

peter_job_workday = Job.create!({
  description: "I want a drone following me whole day, to a capture my work day",
  location: "Amsterdam",
  date: "Mon, 23 Mar 2016",
  user: client_peter,
  title: "Capture my day"
})

########################################

# HARM

client_harm = User.new({
  first_name: "Harm",
  last_name: "Brandsma",
  email: "boerharm@hotmail.com",
  password: "wachtwoord",
  owner: false
  })
client_harm[:profile_pic] = "v1459502497/harmoetriessen_vkzrbg.jpg"
client_harm[:banner_pic] = "v1459418366/bma5tt1kgoknbcabnlbs.jpg"
client_harm.save!

harm_job_crops = Job.create!({
  description: "My crops needs to be inspected, has someone a drone that can do that?",
  location: "Amsterdam",
  date: "Mon, 04 Apr 2016",
  user: client_harm,
  title: "Farm inspection"
  })

harm_job_farm = Job.create!({
  description: "I lost a sheep, can someone help me track it",
  location: "Amsterdam",
  date: "Fri, 01 Apr 2016",
  user: client_harm,
  title: "Sheep lost"
})

########################################

puts "creating categories..."

# CATEGORIES

education = Category.create!({name: "education"})
environment = Category.create!({name: "environment"})
family = Category.create!({name: "family"})
festival = Category.create!({name: "festival"})
fun = Category.create!({name: "fun"})
other = Category.create!({name: "other"})
sport = Category.create!({name: "sport"})
wedding = Category.create!({name: "wedding"})

JobCategory.create!(job: peter_job_farm, category: environment)
JobCategory.create!(job: peter_job_property, category: environment)
JobCategory.create!(job: peter_job_property, category: other)
JobCategory.create!(job: peter_job_property, category: family)
JobCategory.create!(job: peter_job_workday, category: fun)
JobCategory.create!(job: peter_job_workday, category: other)
JobCategory.create!(job: harm_job_crops, category: environment)
JobCategory.create!(job: harm_job_farm, category: environment)

UserCategory.create!(user: roy, category: wedding)
UserCategory.create!(user: roy, category: other)
UserCategory.create!(user: tom, category: sport)
UserCategory.create!(user: tom, category: fun)
UserCategory.create!(user: tom, category: festival)
UserCategory.create!(user: iris, category: environment)
UserCategory.create!(user: iris, category: education)

puts "DONE!"