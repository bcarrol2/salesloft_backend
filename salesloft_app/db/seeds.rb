# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

not_me = User.create(first_name: 'Kyle', last_name: 'Porter', email: 'kyle_porter@salesloft.com', email_confirmed: true, password: 'password', password_confirmed: true)
user2 = User.create(first_name: 'Kevin', last_name: 'Pots', email: 'kevin_pots@salesloft.com', email_confirmed: true, password: 'password', password_confirmed: true)

require 'faker'
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
25.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.unique.email
  email_confirmed = true, 
  password = 'password', 
  password_confirmed = true
  User.create(first_name: first_name, last_name: last_name, email: email, email_confirmed: email_confirmed, password: password, password_confirmed: password_confirmed)
end