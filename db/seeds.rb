# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

t1 = Trip.create land: "Germany" , region: "hessen" , hotel: "Bla" , preis: 123.45

pw = "qwertzuiop"

u1 = User.create email: "a1@asd.de" , password: pw , password_confirmation: pw
u2 = User.create email: "b1@asd.de" , password: pw , password_confirmation: pw
u3 = User.create email: "c1@asd.de" , password: pw , password_confirmation: pw

r1 = Rating.create rating: 3 , trip: t1 , user: u1
r2 = Rating.create rating: 4 , trip: t1 , user: u2
r3 = Rating.create rating: 2 , trip: t1 , user: u3