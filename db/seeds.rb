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
admin = User.find_or_initialize_by(
  email: 'admin@admin.com',
  role: 2
)
admin.password = 'passpass'

admin.skip_confirmation!
admin.save

 #Create premium user
premium = User.find_or_initialize_by(
  email: 'premium@premium.com',
  role: 1
)
premium.password = 'passpass'

premium.skip_confirmation!
premium.save

 #Create standard user
standard = User.find_or_initialize_by(
  email: 'standard@standard.com',
  role: 0
)
standard.password = 'passpass'

standard.skip_confirmation!
standard.save

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
 
 

