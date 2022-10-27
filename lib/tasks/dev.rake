# frozen_string_literal: true

namespace :dev do
  desc 'Development setup'
  task setup: :environment do
    images_path = Rails.root.join('public', 'ads')
    puts 'Running development setup...'

    puts ">> Erasing database... #{`rails db:drop`}"
    puts ">> Erasing images... #{`rm -rf #{images_path}`}"
    puts ">> Creating database... #{`rails db:create`}"
    puts ">> Migrating database... #{`rails db:migrate`}"
    puts ">> Generating database seeds... #{`rails db:seed`}"
    puts `rails dev:admin_setup`
    puts `rails dev:member_setup`
    puts `rails dev:ad_setup`

    puts '>> Development setup finished!'
  end

  #################################################################

  desc 'Administrators generator'
  task admin_setup: :environment do
    puts '>> Generating fake administrators...'

    18.times do
      Admin.create!(
        email: Faker::Internet.email,
        password: '12345678',
        password_confirmation: '12345678',
        name: Faker::Name.name,
        role: [0, 0, 1, 1, 1].sample
      )
    end

    puts '>> Fake administrators successfuly generated!'
  end

  #################################################################

  desc 'Members generator'
  task member_setup: :environment do
    puts '>> Generating fake members...'

    50.times do
      Member.create!(
        email: Faker::Internet.email,
        password: '12345678',
        password_confirmation: '12345678'
      )
    end

    puts '>> Fake members successfuly generated!'
  end

  #################################################################

  desc 'Ads generator'
  task ad_setup: :environment do
    puts '>> Generating fake ads...'

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence(word_count: [2, 3, 4, 5].sample),
        description: Faker::Lorem.sentence(word_count: [15, 20, 25, 30].sample),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)}.#{Random.rand(99)}",
        picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.png"), 'r')
      )
    end

    puts '>> Fake ads successfuly generated!'
  end
end
