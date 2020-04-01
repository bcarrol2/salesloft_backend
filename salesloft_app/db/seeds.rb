# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(first_name: 'Kyle', last_name: 'Porter', email: 'kyle_porter@salesloft.com', password: 'password', money_spent: 100000, phone_number: "4041008000")
user2 = User.create!(first_name: 'Ken', last_name: 'Portier', email: 'kyle_porter00@salesloft.com', password: 'password', money_spent: 0, phone_number: "4041008888")
user3 = User.create!(first_name: 'Kipper', last_name: 'Port', email: 'kyle_porters@salesloft.com', password: 'password', money_spent: 100, phone_number: "4041008080")
user4 = User.create!(first_name: 'Kevin', last_name: 'Pots', email: 'kyle_porter@gmail.com', password: 'password', money_spent: 10, phone_number: "4042007000")

require 'faker'
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
150.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.unique.email
  password = 'password', 
  money_spent = rand(0..99000)
  phone_number = rand(1000000000..9999999999).to_s
  User.create!(first_name: first_name, last_name: last_name, email: email, password: password, money_spent: money_spent, phone_number: phone_number)
end