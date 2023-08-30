# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

feature_video = Video.create(
  user: sam,
  views: 0,
  title: "Hey Folks, it's ShowTime!",
  language: 'English',
  video_type: 'Film',
  category: 'Documentary',
  description: "Come along the journey with us to build the next revolutuonary app.",
  studio: le_wagon
)
feature_video.thumbnail.attach(
  io: File.open('app/assets/images/10-12.jpg'), # TO DO: update file
  filename: '10-12.jpg',
  content_type: 'image/jpg'
)
feature_video.videofile.attach(
  io: File.open('app/assets/images/3 second video.mp4'), # TO DO: update file
  filename: '3 second video.mp4',
  content_type: 'video/mp4'
)
