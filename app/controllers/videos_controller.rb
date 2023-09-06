class VideosController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_video, only: %i[ show edit update destroy ]

  # GET /videos or /videos.json
  def index
    @videos = Video.all
    if params[:query].present?
      videos_by_title = @videos.where("title ILIKE ?", "%#{params[:query]}%")

      # Join videos with Videogenrejoin and genres, and filter by genre name
      videos_by_genre = @videos.joins(:videogenrejoins, :genres).where("genres.name ILIKE ?", "%#{params[:query]}%")

      # Combine the results using the union method
      @videos = (videos_by_title + videos_by_genre).uniq
    end


    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "videos/list", locals: {videos: @videos}, formats: [:html] }
    end
  end

  # GET /videos/1 or /videos/1.json
  def show
    # views = @videos.views
    # @videos.update_column(:views, views + 1)
    @review =Review.new
    @cast = @video.users
    @roles = []
    @video.users.each_with_index do |user, index|
      @roles << [@video.casts[index][:role]]
    end

  end

  # GET /videos/new
  def new
    @video = Video.new
    @cast = Cast.new
    @studios = Studio.all
    @users = User.all
    @genres = Genre.all
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos or /videos.json
  def create

    @video = Video.new(video_params)
    @video.user = current_user
    @video.users = params[:video][:users].reject(&:empty?).map(&:to_i).map { |id| User.find { |user| user[:id] == id } }
    @video.genres = params[:video][:genres].reject(&:empty?).map(&:to_i).map { |id| Genre.find { |genre| genre[:id] == id } }



    respond_to do |format|
      if @video.save
        format.html { redirect_to dashboard_path, notice: "Video was successfully created." }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
    set_cast
    @roles = [@video.casts]
  end

  # PATCH/PUT /videos/1 or /videos/1.json

  def update

    @video.users = params[:video][:users].reject(&:empty?).map(&:to_i).map { |id| User.find { |user| user[:id] == id } }
    @video.genres = params[:video][:genres].reject(&:empty?).map(&:to_i).map { |id| Genre.find { |genre| genre[:id] == id } }
    set_cast
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to video_url(@video), notice: "Video was successfully updated." }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1 or /videos/1.json
  def destroy
    @video.destroy

    respond_to do |format|
      format.html { redirect_to videos_url, notice: "Video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    def set_cast
      @role_array = []
      params[:video].each do |key, value|
        # Check if the key matches the pattern "castX" where X is a number
        if key =~ /casts(\d+)/
          @role_array << value
        end
      end
      @video.users.each_with_index do |user, index|
        Cast.find_by(user_id: user.id, video_id: @video.id).update_column(:role, @role_array[index])
      end
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:title, :views, :genres, :type, :description, :language, :studio_id, :thumbnail, :videofile, :users)
    end
end
