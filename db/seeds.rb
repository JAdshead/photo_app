# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Album.destroy_all
Photo.destroy_all

user=User.new(:email=>'admin@admin.com',:name=>'admin',:password=>'password', :role=>'admin')
user.skip_confirmation!
user.save


user2=User.new(:email=>'bob@user.com',:name=>'Bob Bobby',:password=>'password', :role=>'user')
user.skip_confirmation!
user.save

album1=Album.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph)
album1.user = user2
album1.save

# photo1= Photo.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph)
# photo1.album = album1
# photo1.save
# photo2= Photo.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph)
# photo2.album = album1
# photo2.save
# photo3= Photo.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph)
# photo3.album = album1
# photo3.save
# photo4= Photo.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph)
# photo4.album = album1
# photo4.save
