# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create!(email: "user@email.com", password: "password", validic_id: SecureRandom.hex)
5.times do |count|
  Task.create!(name: Faker::Hacker.say_something_smart, start_on: Date.today,
      due_on: Date.today+2.day, completed: false, order_number: count+1, user_id: user.id)
end
