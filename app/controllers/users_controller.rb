class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_video, only: %i[show]

  def index
    @users = User.all
  end

  def show
    # @videos = Video.where(user_id: @user.id)
    @videos = @user.videos
    @video = @user.videos.last
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @user = User.find(params[:id])
  end
end
