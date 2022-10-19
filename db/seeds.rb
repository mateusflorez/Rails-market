puts 'Generating categories...'
categories = [
               'Animals and accessories',
               'Sports',
               'For your home',
               'Electronics and phones',
               'Music and hobbies',
               'Babies and childs',
               'Fashion and beauty',
               'Vehicles and boats',
               'Properties',
               'Jobs and business'
             ]

categories.each do |category|
  Category.find_or_create_by(description: category)
end

puts 'Categories successfuly generated!'

#################################################################

puts 'Generating administrators...'

Admin.create!(
              email: "admin@admin.com",
              password: "admin@admin.com",
              password_confirmation: "admin@admin.com",
              name: "Administrator",
              role: 0
             )

Admin.create!(
email: "mod@mod.com",
password: "mod@mod.com",
password_confirmation: "mod@mod.com",
name: "Moderator",
role: 1
)

18.times do
  Admin.create!(
    email: Faker::Internet.email,
    password: "12345678",
    password_confirmation: "12345678",
    name: Faker::Name.name,
    role: [0,0,1,1,1].sample
  )
end

puts 'Administrators successfuly generated!'

#################################################################

puts 'Generating members...'

50.times do
  Member.create!(
    email: Faker::Internet.email,
    password: "12345678"
  )
end

puts 'Members successfuly generated!'

#################################################################

puts 'Generating fake ads...'

100.times do
  Ad.create!(
    title: Faker::Lorem.sentence([2,3,4,5].sample),
    description: LeroleroGenerator.paragraph(Random.rand(3)),
    member: Member.all.sample,
    category: Category.all.sample
  )
end

puts 'Fake ads successfuly generated!'
