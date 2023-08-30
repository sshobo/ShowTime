# READ ME: using API TMDB(you can check the urls) for fetching movies and tv shows info, to create video models.
# READ ME: for now we are no using categories intead we have top rated and trending.
# READ ME: run this in the terminal export CLOUDINARY_URL=cloudinary://738767187456176:BxQ6TfZx0tXPj15g9nNLPPCItFk@dez1ybpgi if the seed ask for the cloudinary api_key
# READ ME: there is not youtube video linked yet
# READ ME: also creating to users Cecil as a viewer and Joan creator you can check the emails and password
# READ ME: using Joan user in the videos user_id

require 'json'
require 'open-uri'

top_rated_movies_api_url = URI("https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")
user_serialized = URI.open(top_rated_movies_api_url, 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZWMzOWEwNTViN2IwNGYxM2RlZGRlYWEzYTMxNjA0YiIsInN1YiI6IjY0ZWUwNzc5ODM5MDE4MDExZjhlZjA2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S6nNDVApwZoTYIzDMEhfRbdSH6otKXYIPH8H_8uM-dg').read
top_movies_hash = JSON.parse(user_serialized)["results"]

top_rated_tv_api_url = URI("https://api.themoviedb.org/3/tv/top_rated?language=en-US&page=1")
user_serialized = URI.open(top_rated_tv_api_url, 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZWMzOWEwNTViN2IwNGYxM2RlZGRlYWEzYTMxNjA0YiIsInN1YiI6IjY0ZWUwNzc5ODM5MDE4MDExZjhlZjA2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S6nNDVApwZoTYIzDMEhfRbdSH6otKXYIPH8H_8uM-dg').read
top_tv_hash = JSON.parse(user_serialized)["results"]

trending_movies_api_url = URI("https://api.themoviedb.org/3/trending/movie/week?language=en-US")
user_serialized = URI.open(trending_movies_api_url, 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZWMzOWEwNTViN2IwNGYxM2RlZGRlYWEzYTMxNjA0YiIsInN1YiI6IjY0ZWUwNzc5ODM5MDE4MDExZjhlZjA2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S6nNDVApwZoTYIzDMEhfRbdSH6otKXYIPH8H_8uM-dg').read
trending_movies_hash = JSON.parse(user_serialized)["results"]

trending_tv_api_url = URI("https://api.themoviedb.org/3/trending/tv/week?language=en-US")
user_serialized = URI.open(trending_tv_api_url, 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZWMzOWEwNTViN2IwNGYxM2RlZGRlYWEzYTMxNjA0YiIsInN1YiI6IjY0ZWUwNzc5ODM5MDE4MDExZjhlZjA2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S6nNDVApwZoTYIzDMEhfRbdSH6otKXYIPH8H_8uM-dg').read
trending_tv_hash = JSON.parse(user_serialized)["results"]

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


puts "Creating videos"

def create_video(movie, user_creator, category, video_type)
  video = Video.new(
    title: movie["title"],
    views: movie["vote_count"],
    language: movie["original_language"],
    video_type: video_type,
    category: category,
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

  video.save
end

top_movies_hash.each do |movie|
  create_video(movie, user_creator, "top_movies","movie")
end

trending_movies_hash.each do |movie|
  create_video(movie, user_creator, "trending_movies","movie")
end

top_tv_hash.each do |tv|
  create_video(tv, user_creator, "top_tv","tv")
end

trending_tv_hash.each do |tv|
  create_video(tv, user_creator, "trending_tv","tv")
end
