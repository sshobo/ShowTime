class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    sam = User.find_by(last_name: "Shobo")
    @feature_video = Video.find_by(user: sam)
    @videos = Video.all
    @top_tv = Video.joins(:videogenrejoins).where(videogenrejoins: { genre_id: 39} )
    @trending_movies = Video.joins(:videogenrejoins).where(videogenrejoins: { genre_id: 35} )
    @top_movies = Video.joins(:videogenrejoins).where(videogenrejoins: { genre_id: 33} )
  end

  def dashboard
    @videos = Video.all
    @video = Video.new
    @studios = Studio.all
  end
end
