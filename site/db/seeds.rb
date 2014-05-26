# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create admin user
email = 'adm@adm.com'
password = 'aaaaaaaa'

admin = Admin.new
admin.email = email
admin.password = password
admin.password_confirmation = password
admin.save!
puts "Admin user created with email [#{email}] and password [#{password}]. Remember to change!"

# Create User user
email = 'usr@usr.com'
password = 'uuuuuuuu'

user = User.new
user.email = email
user.password = password
user.password_confirmation = password
user.confirmed_at = DateTime.now
user.save!
puts "User user created with email [#{email}] and password [#{password}]. Remember to change!"