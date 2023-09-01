# READ ME: using API TMDB(you can check the urls) for fetching movies and tv shows info, to create video models.
# READ ME: for now we are no using categories intead we have top rated and trending.
# READ ME: run this in the terminal export CLOUDINARY_URL=cloudinary://738767187456176:BxQ6TfZx0tXPj15g9nNLPPCItFk@dez1ybpgi if the seed ask for the cloudinary api_key
# READ ME: there is not youtube video linked yet
# READ ME: also creating to users Cecil as a viewer and Joan creator you can check the emails and password
# READ ME: using Joan user in the videos user_id
# READ ME: it takes a few seconds to run the file cause we uploading the img from the api

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

Review.destroy_all
Video.destroy_all
Studio.destroy_all
User.destroy_all

puts "Creating users..."

sam = User.create(
  first_name: "Samuel",
  last_name: "Shobo",
  email: "sshobo@showtime.com",
  password: "123456",
  creator: true
)

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
  creator: true
)

user_viewer.save
user_creator.save

puts "Creating studios..."

le_wagon = Studio.create(name: "LW Studios")

puts "Creating videos..."

# create feature video

# feature_video = Video.create(
#   user: sam,
#   views: 0,
#   title: "Hey Folks, it's ShowTime!",
#   language: 'English',
#   video_type: 'Film',
#   category: 'Documentary',
#   description: "Come along the journey with us to build the next revolutuonary app.",
#   studio: le_wagon
# )
# feature_video.thumbnail.attach(
feature_video = Video.create(
  user: sam,
  views: 0,
  title: "The Office US",
  language: 'English',
  video_type: 'Film',
  category: 'Comedy',
  description: "A motley group of office workers go through hilarious misadventures at the Scranton, Pennsylvania, branch of the Dunder Mifflin Paper Company.",
  studio: le_wagon
)
feature_video.thumbnail.attach(
  io: File.open('app/assets/images/the_office_us thumbnail.jpeg'), # TO DO: update file
  filename: 'the_office_us thumbnail.jpeg',
  content_type: 'image/jpeg'
)
feature_video.videofile.attach(
  io: File.open('app/assets/images/the_office_us.mp4'), # TO DO: update file
  filename: 'the_office_us.mp4',
  content_type: 'video/mp4'
)


# create dummy videos
def create_video(movie, user_creator, category, video_type)
  if video_type == "movie"
    title = movie["title"]
  else
    title = movie["name"]
  end
  video = Video.new(
    title: title,
    views: movie["vote_count"],
    language: movie["original_language"],
    video_type: video_type,
    category: category,
    description: movie["overview"]
  )
  thumbnail_url = "https://image.tmdb.org/t/p/w500#{movie["backdrop_path"]}"
  begin
    thumbnail_io = URI.open(thumbnail_url)
    video.thumbnail.attach(
      io: thumbnail_io,
      filename: "#{video.title}_thumbnail.png",
      content_type: "image/png"
    )
  rescue OpenURI::HTTPError => e
    puts "Error: #{e.message}"  # Display the error message
  rescue StandardError => e
    puts "An error occurred: #{e.message}"
  end
  puts video.category
  video.user = user_creator
  video.save
end

top_movies_hash.each do |movie|
  create_video(movie, user_creator, "top_movies", "movie")
end
trending_movies_hash.each do |movie|
  create_video(movie, user_creator, "trending_movies", "movie")
end
top_tv_hash.each do |tv|
  create_video(tv, user_creator, "top_tv", "tv")
end
trending_tv_hash.each do |tv|
  create_video(tv, user_creator, "trending_tv", "tv")
end

puts "Displaying videos"

Video.all.each do |video|
  puts "ID: #{video.id}"
  puts "User ID: #{video.user_id}"
  puts "Views: #{video.views}"
  puts "Title: #{video.title}"
  puts "Language: #{video.language}"
  puts "Video Type: #{video.video_type}"
  puts "Category: #{video.category}"
  puts "Description: #{video.description}"
  puts "Studio ID: #{video.studio_id}"
  puts "--------------------------------"
end

Review.create!(
  rating: 4,
  content: "One can only imagine the chilling impact on oceanic circulation patterns as temperature and pressure interplay during the ascent from the depths of the Atlantic abyss to the coastal waters.",
  user: User.first,
  video: Video.last
)

Review.create!(
  rating: 2,
  content: "Bradley Charles Cooper is an American actor and filmmaker. He is the recipient of various accolades, including a British Academy Film Award and two Grammy Awards",
  user: User.second,
  video: Video.last
)
