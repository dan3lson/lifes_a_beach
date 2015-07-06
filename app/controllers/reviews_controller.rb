class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :authorize_user, except: [:index, :show]
  respond_to :html, :json

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
    else
      flash[:error] = @review.errors.full_messages.join(". ")
    end
    respond_with(@beach)
  end

  def edit
  end

  def update
    @review.user = current_user
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
    if @review.destroy
      flash[:success] = "Review deleted successfully."
    else
      flash.now[:danger] = "Review not deleted."
    end
    respond_with(@beach)
  end

  private

  def set_review
    @beach = Beach.find(params[:beach_id])
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(
      :rating,
      :description,
      :beach_id,
      :user_id,
      :score
    )
  end

  def authorize_user
    if !user_signed_in? && current_user != Review.find(params[:id]).user
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
