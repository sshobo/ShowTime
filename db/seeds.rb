require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   Videos = Video.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", Video: Videos.first)
# video1 = Video.create([{ title: 'st', image_url: "showtimestar.jpeg" }])
# video2 = Video.create([{ title: "The Empire Strikes Back", image_url: "empirestrikesback.jpeg" }])
# video3 = Video.create([{ title: "Return of the Jedi", image_url: "returnofthejedi.jpeg" }])
# video4 = Video.create([{ title: "The Phantom Menace", image_url: "thephantommenace.jpeg" }])
# video5 = Video.create([{ title: "Don't be a menace to south central while drinking your juice in the hood", image_url: "dontbeamenace.jpg" }])
# video6 = Video.create([{ title: "Menace II Society", image_url: "menace2society.jpg" }])
# video7 = Video.create([{ title: "friday", image_url: "friday.jpeg" }])
# video8 = Video.create([{ title: "next friday", image_url: "nextfriday.jpeg" }])

file = URI.open("https://cdn.europosters.eu/image/750/posters/star-wars-a-new-hope-one-sheet-i28733.jpg")
video1 = Video.new(title: "Star Wars: A New Hope", description: "Star Wars: Episode IV - A New Hope is the original 1977
film that introduced audiences to the Star Wars universe. It follows Luke Skywalker's journey from a desert planet to
become a hero in the Rebel Alliance's fight against the oppressive Galactic Empire, featuring iconic characters like
Darth Vader, Princess Leia, and Han Solo.")
video1.thumbnail.attach(io: file, filename: "nes.png", content_type: "image/jpg")
video1.user = User.last
video1.save!
