# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = Admin.create(:first_name=>'Admin',:last_name=>"",:email=>"admin@example.com",:password=>'admin123',:password_confirmation=>'admin123',:date_of_birth=>'1989-12-07')