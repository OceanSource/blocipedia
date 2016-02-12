  require 'faker'
  
#Create users
1.times do
    user = User.new(
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
    
  user.skip_confirmation!
  user.save
end
 
 #Create admin user
 ocean = User.new(
    email: 'oceansourced@gmail.com',
    password: 'passpass',
    role: 2
  )
  ocean.skip_confirmation!
  ocean.save
  
  users = User.all
 
 
 50.times do
   Wiki.create!(
     user: users.sample,
     title: Faker::Lorem.sentence,
     body:  Faker::Lorem.paragraph
   )
 end
  
wikis = Wiki.all
 
 
 
 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
 puts "#{User.count} users created"
 
 

