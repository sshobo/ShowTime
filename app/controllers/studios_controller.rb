class StudiosController < ApplicationController
  def new

  end

  def index
    @studio = Studio.new
    @studios = Studio.all
  end

  def create
    @studio = Studio.new(studio_params)
    respond_to do |format|
      if @studio.save
        format.html { redirect_to dashboard_path, notice: "We'll get back to you" }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  private

  def studio_params
    params.require(:studio).permit(:name, :logo)
  end
end
