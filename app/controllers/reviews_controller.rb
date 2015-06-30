class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @beach = Beach.find(params[:beach_id])
  end

  def create
    @user = User.first
    @review = Review.new(review_params)
    @beach = Beach.find(params[:beach_id])
    @review.beach_id = @beach.id
    @review.user_id = @user.id
    if @review.save
      flash[:notice] = 'Review added.'
      redirect_to beach_path(@beach)
    else
      flash[:error] = 'Review information incomplete.'
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description, :beach_id, :user_id, :score)
  end
end
