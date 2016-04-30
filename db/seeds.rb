# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: 'juan.celhay@gmail.com',
             password: 'mamamia123',
             name: 'Juan Celhay',
             password_confirmation: 'mamamia123',
             teacher: true)
School.create(name: 'Colegio SiemprePenca')
SchoolClass.create(name: '3°A', securityCode: '12345', user_id: 1, school_id: 1)