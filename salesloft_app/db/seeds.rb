# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

me = User.create(first_name: 'Kyle', last_name: 'Porter', email: 'kyle_porter@salesloft.com', email_confirmed: true, password: 'password', password_confirmed: true)