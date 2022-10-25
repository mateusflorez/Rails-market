# frozen_string_literal: true

puts '>> Generating categories...'
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

puts '>> Categories successfuly generated!'

#################################################################

puts '>> Generating default administrators...'

Admin.create!(
  email: 'admin@admin.com',
  password: 'admin@admin.com',
  password_confirmation: 'admin@admin.com',
  name: 'Administrator',
  role: 0
)

Admin.create!(
  email: 'mod@mod.com',
  password: 'mod@mod.com',
  password_confirmation: 'mod@mod.com',
  name: 'Moderator',
  role: 1
)

puts '>> Default administrators successfuly generated!'

#################################################################

puts '>> Generating default member...'

Member.create!(
  email: 'member@member.com',
  password: '12345678',
  password_confirmation: '12345678'
)

puts '>> Default member successfuly generated!'
