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
      flash[:notice] = 'Review created successfully.'
      redirect_to beach_path(@beach)
    else
      flash[:error] = @review.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @beach = Beach.find(params[:beach_id])
    @review = Review.find(params[:id])
  end

  def update
    @beach = Beach.find(params[:beach_id])
    @user = current_user
    @review = Review.find(params[:id])
    @review.user = @user
    if @review.update(review_params)
      flash[:notice] = "Review updated successfully."
      redirect_to beach_path(@beach)
    else
      flash.now[:notice] = "Review not updated successfully. " +
        @review.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    @beach = Beach.find(params[:beach_id])
    @review = Review.find(params[:id])
    @user = current_user
    @review.user = @user
    if @review.destroy
      flash[:success] = "Review deleted successfully."
      redirect_to beach_path(@beach)
    else
      flash.now[:danger] = "Review not deleted."
      redirect_to beach_path(@beach)
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
