class ReviewsController < ApplicationController
  def new
    @beach = Beach.find(params[:beach_id])
    @review = Review.new
  end

  def create
    @beach = Beach.find(params[:beach_id])
    @review = Review.new(review_params)
    @review.beach = @beach
    @review.user = current_user
    if @review.save
      flash[:notice] = 'Review added.'
      redirect_to beach_path(@beach)
    else
      flash[:error] = @review.errors.full_messages.join(". ")
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description,
      :beach_id,
      :user_id,
      :score
    )
  end
end
