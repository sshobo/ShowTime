class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # sam = User.find_by(last_name: "Shobo")
    @feature_video = Video.find_by(title: "1302 Not 90210")
    @videos = Video.all
    # jt = Video.joins(videogenrejoins: :genre)
    # @top_tv = jt.where(genres: {name: 'Thriller'})
    # @trending_movies = jt.where(genres: {name: 'Epic'})
    # @top_movies = jt.where(genres: {name: 'Epic'})
    # Take 12 samples
    @shuffled_videos = @videos.shuffle
    @samples = @shuffled_videos.sample(15)

    @sample_a1 = @samples[0..4]
    @sample_b1 = @samples[5..9]
    @sample_c1 = @samples[10..14]

    @shuffled_videos = @videos.shuffle
    @samples = @shuffled_videos.sample(15)

    @sample_a2 = @samples[0..4]
    @sample_b2 = @samples[5..9]
    @sample_c2 = @samples[10..14]

    @shuffled_videos = @videos.shuffle
    @samples = @shuffled_videos.sample(15)

    @sample_a3 = @samples[0..4]
    @sample_b3 = @samples[5..9]
    @sample_c3 = @samples[10..14]
  end

  def dashboard
    @user = current_user
    @videos_uploaded = Video.where(user_id: @user.id)
    @videos = @user.videos
    @video = Video.new
    @studios = Studio.all
  end
end
