class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    sam = User.find_by(last_name: "Shobo")
    @feature_video = Video.find_by(user: sam)
    @videos = Video.all
    @top_tv = Video.where(category: "top_tv").sample(4)
    @trending_movies = Video.where(category: "trending_movies").sample(4)
    @top_movies = Video.where(category: "top_movies").sample(4)
  end

  def dashboard
    @videos = Video.all
    @video = Video.new
    @studios = Studio.all
  end
end
