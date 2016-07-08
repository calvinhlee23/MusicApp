# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new
u.email = "calvinhlee23@gmail.com"
u.password = "password"
u.save

b = Band.new
b.name = "First Band"
b.save

a = Album.new
a.title = "First Album of First Band"
a.band_id = b.id
a.los = "live"
a.save

t = Track.new
t.title = "First Track of First Album of First Band"
t.album_id = a.id
t.bor = "bonus"
t.lyrics = "woaaaaa~~ this is the first line of the first song of the first album of the first band~~~"
t.save
