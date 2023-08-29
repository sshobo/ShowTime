require 'json'
require 'open-uri'

url = URI("https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")
user_serialized = URI.open(url, 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZWMzOWEwNTViN2IwNGYxM2RlZGRlYWEzYTMxNjA0YiIsInN1YiI6IjY0ZWUwNzc5ODM5MDE4MDExZjhlZjA2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S6nNDVApwZoTYIzDMEhfRbdSH6otKXYIPH8H_8uM-dg').read
top_movies_hash = JSON.parse(user_serialized)["results"]

puts "Cleaning database..."

Video.destroy_all
User.destroy_all

puts "Creating users"

# create 2 users
user_viewer = User.new(
  first_name: "Cecil",
  last_name: "Sabi",
  email: "cecilviewer@gmail.com",
  password: "123456",
  creator: false
)

user_creator = User.new(
  first_name: "Joan",
  last_name: "Alemany",
  email: "joancreator@gmail.com",
  password: "123456",
  creator: false
)

user_viewer.save
user_creator.save

# ... (previous code)

puts "Creating videos"

def create_video(movie, user_creator)
  video = Video.new(
    title: movie["title"],
    views: movie["vote_count"],
    language: movie["original_language"],
    video_type: "movie",
    category: "classic",
    description: movie["overview"]
  )

  video.user = user_creator

  thumbnail_url = "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
  thumbnail_io = URI.open(thumbnail_url)
  video.thumbnail.attach(io: thumbnail_io, filename: "#{movie["title"]}_thumbnail.png", content_type: "image/png")

  puts video.title
  puts video.views
  puts video.language
  puts video.video_type
  puts video.category
  puts video.description
  puts video.thumbnail

  video.save
end

top_movies_hash.each do |movie|
  create_video(movie, user_creator)
end
