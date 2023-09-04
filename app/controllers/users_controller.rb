class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_video, only: %i[show]

  def index
    @users = User.all
    if params[:query].present?
      @users = @users.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "users/list", locals: {users: @users}, formats: [:html] }
    end
  end

  def show
    @videos = @user.videos
    @video = @user.videos.last
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @user = User.find(params[:id])
  end
end
