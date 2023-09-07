# READ ME: using API TMDB(you can check the urls) for fetching movies and tv shows info, to create video models.
# READ ME: also creating to users Cecil as a viewer and Joan creator you can check the emails and password
# READ ME: using Joan user in the videos user_id
# READ ME: it takes a few seconds to run the file cause we uploading the img from the api

require 'json'
require 'open-uri'
require 'faker'

# top_rated_movies_api_url = URI("https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")
# user_serialized = URI.open(top_rated_movies_api_url, 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZWMzOWEwNTViN2IwNGYxM2RlZGRlYWEzYTMxNjA0YiIsInN1YiI6IjY0ZWUwNzc5ODM5MDE4MDExZjhlZjA2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S6nNDVApwZoTYIzDMEhfRbdSH6otKXYIPH8H_8uM-dg').read
# top_movies_hash = JSON.parse(user_serialized)["results"]

# top_rated_tv_api_url = URI("https://api.themoviedb.org/3/tv/top_rated?language=en-US&page=1")
# user_serialized = URI.open(top_rated_tv_api_url, 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZWMzOWEwNTViN2IwNGYxM2RlZGRlYWEzYTMxNjA0YiIsInN1YiI6IjY0ZWUwNzc5ODM5MDE4MDExZjhlZjA2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S6nNDVApwZoTYIzDMEhfRbdSH6otKXYIPH8H_8uM-dg').read
# top_tv_hash = JSON.parse(user_serialized)["results"]

# trending_movies_api_url = URI("https://api.themoviedb.org/3/trending/movie/week?language=en-US")
# user_serialized = URI.open(trending_movies_api_url, 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZWMzOWEwNTViN2IwNGYxM2RlZGRlYWEzYTMxNjA0YiIsInN1YiI6IjY0ZWUwNzc5ODM5MDE4MDExZjhlZjA2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S6nNDVApwZoTYIzDMEhfRbdSH6otKXYIPH8H_8uM-dg').read
# trending_movies_hash = JSON.parse(user_serialized)["results"]

# trending_tv_api_url = URI("https://api.themoviedb.org/3/trending/tv/week?language=en-US")
# user_serialized = URI.open(trending_tv_api_url, 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZWMzOWEwNTViN2IwNGYxM2RlZGRlYWEzYTMxNjA0YiIsInN1YiI6IjY0ZWUwNzc5ODM5MDE4MDExZjhlZjA2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S6nNDVApwZoTYIzDMEhfRbdSH6otKXYIPH8H_8uM-dg').read
# trending_tv_hash = JSON.parse(user_serialized)["results"]

movie_genres_api_url = URI("https://api.themoviedb.org/3/genre/movie/list?language=en")
user_serialized = URI.open(movie_genres_api_url, 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZWMzOWEwNTViN2IwNGYxM2RlZGRlYWEzYTMxNjA0YiIsInN1YiI6IjY0ZWUwNzc5ODM5MDE4MDExZjhlZjA2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S6nNDVApwZoTYIzDMEhfRbdSH6otKXYIPH8H_8uM-dg').read
movie_genres_hash = JSON.parse(user_serialized)["genres"]

tv_genres_api_url = URI("https://api.themoviedb.org/3/genre/tv/list?language=en")
user_serialized = URI.open(tv_genres_api_url, 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZWMzOWEwNTViN2IwNGYxM2RlZGRlYWEzYTMxNjA0YiIsInN1YiI6IjY0ZWUwNzc5ODM5MDE4MDExZjhlZjA2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S6nNDVApwZoTYIzDMEhfRbdSH6otKXYIPH8H_8uM-dg').read
tv_genres_hash = JSON.parse(user_serialized)["genres"]

indie_movies = []

start_page = 480
end_page = 500

(start_page..end_page).each do |page|
  indie_movies_api_url = URI("https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=#{page}&sort_by=popularity.asc")
  user_serialized = URI.open(indie_movies_api_url, 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZWMzOWEwNTViN2IwNGYxM2RlZGRlYWEzYTMxNjA0YiIsInN1YiI6IjY0ZWUwNzc5ODM5MDE4MDExZjhlZjA2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S6nNDVApwZoTYIzDMEhfRbdSH6otKXYIPH8H_8uM-dg').read
  indie_movies += JSON.parse(user_serialized)["results"]
end


puts "Cleaning database..."
Review.destroy_all
Videogenrejoin.destroy_all
Video.destroy_all
Studio.destroy_all
User.destroy_all
Genre.destroy_all

puts "Creating users..."

admin = User.create(
  first_name: "Admin",
  last_name: "1",
  email: "admin@showtime.com",
  password: "123456",
  creator: true,
  admin: true
)

sam = User.create(
  first_name: "Samuel",
  last_name: "Shobo",
  email: "sshobo@showtime.com",
  password: "123456",
  creator: true
)

user_viewer = User.create(
  first_name: "Joan",
  last_name: "Alemany",
  email: "joanviewer@gmail.com",
  password: "123456",
  creator: false
)

user_creator = User.create(
  first_name: "Phillipe",
  last_name: "John-Jules",
  email: "phillipecreator@gmail.com",
  password: "123456",
  creator: true
)

cecil = User.create(
  first_name: "cecil",
  last_name: "Andi",
  email: "cecilandi@gmail.com",
  password: "123456",
  creator: true
)

phillipe_demo = User.create(
  first_name: "Phillipe",
  last_name: "John",
  email: "phillipe@gmail.com",
  password: "123456",
  creator: false
)


 15.times {
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}#{last_name}@gmail.com"
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: "123456",
    creator: [false, true].sample
  )
 }

user_creator.profile.attach(
  io: File.open('app/assets/images/menace2society.jpg'), # TO DO: update file
  filename: 'm2c.jpg',
  content_type: 'image/jpg'
)

puts "Creating studios..."

le_wagon = Studio.create(name: "LW Studios")
le_wagon.logo.attach(io: URI.open("https://www.pngkit.com/png/detail/157-1573071_about-le-wagon-le-wagon-logo.png"), filename: "lewagon-logo.jpg", content_type: 'image/jpg')
wunderbar = Studio.create(name: "Wunderbar Films ")
wunderbar.logo.attach(io: URI.open("https://pbs.twimg.com/profile_images/437065258851508224/oFhhY_JC_400x400.jpeg"), filename: "wunderbar-logo.jpg", content_type: 'image/jpg')
vff = Studio.create(name: "Visual Film Factory")
vff.logo.attach(io: URI.open("https://upload.wikimedia.org/wikipedia/en/f/f8/Vishal_Film_Factory_logo.jpg"), filename: "vff-logo.jpg", content_type: 'image/jpg')
red_giant = Studio.create(name: "Red Giant Movies")
red_giant.logo.attach(io: URI.open("https://yt3.googleusercontent.com/fhKwYc0YH7Vf_cDMfWo1WZvS5XaMu4I2nak7g8FCCRGAvjqsmWDA3NdWXK8RUkut9Oa5twKwtA=s900-c-k-c0x00ffffff-no-rj"), filename: "red-giant-logo.jpg", content_type: 'image/jpg')
two_d = Studio.create(name: "2D Entertainment")
two_d.logo.attach(io: URI.open("https://live.staticflickr.com/1772/28113575867_f921b7fbe8_b.jpg"), filename: "2d-logo.jpg", content_type: 'image/jpg')

# create genre method
def create_genre(genre)
  genre = Genre.new(
    name: genre["name"],
    api_id: genre["id"]
  )
  puts genre.name
  genre.save
end

puts "Creating feature video..."

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
  title: "1302 Not 90210",
  language: 'English',
  video_type: 'Film',
  description: "Follow the journey of the 40 students from all walks of life - some ex-strippers, some ex-homeless - as they go from zero to code hero in 9 weeks.",
  studio: le_wagon
)

feature_video.thumbnail.attach(
  io: File.open('app/assets/images/the_office_us thumbnail.jpeg'), # TO DO: update file
  filename: 'the_office_us thumbnail.jpeg',
  content_type: 'image/jpeg'
)
feature_video.videofile.attach(
  io: File.open('app/assets/images/LeWagon_2.mov'), # TO DO: update file
  filename: 'LeWagon_2.mov',
  content_type: 'video/mov'
)




puts "Creating genres..."

new_releases = Genre.create(
  name: "New Releases"
)

most_popular = Genre.create(
  name: "Most Popular"
)

# top_movie = Genre.new(
#   name: "Top Movie"
# )

# top_tv = Genre.new(
#   name: "Top TV"
# )

movie_genres_hash.each do |genre|
  create_genre(genre)
end

tv_genres_hash.each do |genre|
  create_genre(genre)
end

Genre.all.each do |genre|
  puts "Name: #{genre.name}"
  puts "Api_id: #{genre.api_id}"
  puts "--------------------------------"
end

# create dummy videos
def create_video(movie, user_creator, video_type, genre, video_users)

  return if movie["backdrop_path"].nil?

  video = Video.new(
    title: movie["title"],
    views: rand(10..10000),
    language: movie["original_language"],
    video_type: video_type,
    description: movie["overview"],
    studio: Studio.all.sample
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
    puts "Error: #{e.message}"
  rescue StandardError => e
    puts "An error occurred: #{e.message}"
  end
  puts video.title
  video.user = user_creator
  video.users = video_users

  video.save

  if video.id.present?
    video.reviews = create_reviews(video)
    puts "Generating fake reviews"

    video_genre_join = Videogenrejoin.new
    video_genre_join.video = video
    video_genre_join.genre = genre
    video_genre_join.save

    movie["genre_ids"].each do |genre_id|
      genre_search = Genre.where("api_id = #{genre_id}")
      video_genre_join = Videogenrejoin.new
      video_genre_join.video = video
      video_genre_join.genre = genre_search[0]
      video_genre_join.save
    end
  else
    # Handle the case when the video is empty
    puts "Video is empty, cannot associate genres."
  end
end

def create_reviews(video) # returns an array of review instances
  reviews = []
  rand(2..6).times do
    reviews << Review.create!(
      rating: rand(3..5),
      content: Faker::Lorem.sentence(word_count: rand(2..10)).chomp('.'),
      user: User.all.sample,
      video: video
    )

  end
  reviews
end

# def create_studios(video)
#   Studio.create!(
#     name: Faker::Company.name + " " + ["Productions","Studios","Pictures"].sample,
#     video: video
#   )
# end
puts "Creating videos..."

# top_movies_hash.each do |movie|
#   create_video(movie, user_creator, "Top Movie", "movie")
# end

# trending_movies_hash.each do |movie|
#   create_video(movie, user_creator, "Trending Movie", "movie")
# end

# top_tv_hash.each do |tv|
#   create_video(tv, user_creator, "Top TV", "tv")
# end

# trending_tv_hash.each do |tv|
#   create_video(tv, user_creator, "Trending TV", "tv")
# end
users = User.all
user_creators = users.where(creator: true)
puts user_creators
indie_movies.each do |movie|
  random_number = rand(2)
  random_number2 = rand(user_creators.length)
  video_creator = user_creators[random_number2]
  video_users = users.sample(4)
  if random_number.zero?
    video_type = "tv"
    genre = new_releases
  else
    video_type = "movie"
    genre = most_popular
  end
  create_video(movie, video_creator, video_type, genre, video_users)
end

puts "Creating reviews..."

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

puts "Displaying videos"

Video.all.each do |video|
  puts video.users
  puts "ID: #{video.id}"
  puts "User ID: #{video.user_id}"
  puts "Views: #{video.views}"
  puts "Title: #{video.title}"
  puts "Language: #{video.language}"
  puts "Video Type: #{video.video_type}"
  puts "Description: #{video.description}"
  puts "Studio ID: #{video.studio_id}"
  puts "--------------------------------"
end

Videogenrejoin.all.each do |videogenrejoin|
  puts "Video id: #{videogenrejoin.video_id}"
  puts "Genre id: #{videogenrejoin.genre_id}"
  puts "--------------------------------"
end

puts "Displaying users"

User.all.each do |user|
  puts "First name: #{user.first_name}"
  puts "Last name: #{user.last_name}"
  puts "Gmail: #{user.email}"
  puts "--------------------------------"
end
