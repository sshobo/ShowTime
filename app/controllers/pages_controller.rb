class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    sam = User.find_by(last_name: "Shobo")
    @feature_video = Video.find_by(user: sam)
  end

  def dashboard
    @videos = Video.all
    @video = Video.new
    @studios = Studio.all
  end
end
