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
