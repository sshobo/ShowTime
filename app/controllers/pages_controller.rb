class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    sam = User.find_by(last_name: "Shobo")
    @feature_video = Video.find_by(user: sam)
  end

  def dashboard
    @users = User.all
    @videos = Video.where(user_id: current_user.id)
    @video = Video.new
    @studios = Studio.all
  end

  def users_full_names
    "#{first_name} #{last_name}"
  end
end
