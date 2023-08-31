class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @video = Video.find(params[:video_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.video = Video.find(params[:video_id])
    if @review.save!
      redirect_to video_path(@review.video)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
