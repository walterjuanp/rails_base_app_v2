# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Admin.new
admin.email = 'adm@adm.com'
admin.password = 'aaaaaaaa'
admin.password_confirmation = 'aaaaaaaa'
admin.save!

user = User.new
user.email = 'usr@usr.com'
user.password = 'uuuuuuuu'
user.password_confirmation = 'uuuuuuuu'
user.confirmed_at = DateTime.now
user.save!