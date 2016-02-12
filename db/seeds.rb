  require 'faker'
  
 # Create Wikis and users

 50.times do
   Wiki.create!(
     user: users.sample,
     title: Faker::Lorem.sentence,
     body:  Faker::Lorem.paragraph
   )
 end
  
wikis = Wiki.all
 
#Create users
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
    
  user.skip_confirmation!
  user.save
end
 
 #Create admin user
 ocean = User.new(
    name: 'Ocean Source',
    email: 'oceansource@gmail.com',
    password: 'passpass',
    role: 'admin'
  )
  ocean.skip_confirmation!
  ocean.save
  
  users = User.all
 
 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
 puts "#{User.count} users created"
 
 

