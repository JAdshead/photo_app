# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin = User.new(name: 'Alice', role: 'admin', email: 'daida.ms+alice@gmail.com', password: 'alice12345', password_confirmation: 'alice12345')
bob = User.new(name: 'Bob', role: 'user', email: 'dmesu@hotmail.com', password: 'bob12345', password_confirmation: 'bob12345')


admin.save!
bob.save!
