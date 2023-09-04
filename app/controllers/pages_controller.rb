class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    sam = User.find_by(last_name: "Shobo")
    @feature_video = Video.find_by(user: sam)
    @videos = Video.all
    jt = Video.joins(videogenrejoins: :genre)
    # @top_tv = jt.where(genres: {name: 'Thriller'})
    # @trending_movies = jt.where(genres: {name: 'Epic'})
    # @top_movies = jt.where(genres: {name: 'Epic'})
    @top_tv = @videos.sample(4)
    @trending_movies = @videos.sample(4)
    @top_movies = @videos.sample(4)
  end

  def dashboard
    @videos = Video.all
    @video = Video.new
    @studios = Studio.all
  end
end
