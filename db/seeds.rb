# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Employee.create(name: "Васильев Василий Иванович", contacts: "test@example.com", searching: true, salary: 50000)
Employee.create(name: "Петров Пётр Петрович", contacts: "793-1517", searching: false, salary: 60000)