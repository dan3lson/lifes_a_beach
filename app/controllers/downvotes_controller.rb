class DownvotesController < ApplicationController
  def create
    if user_signed_in?
      @review = Review.find(params[:review_id])
      @beach = @review.beach
      @downvote = Downvote.new(
        review_id: @review.id,
        user_id: current_user.id
      )
      @review.score -= 1

      if @downvote.save && @review.save
        flash[:success] = "Downvote created successfully."
        redirect_to @beach
      else
        flash[:danger] = "Downvote not created successfully."
        render :new
      end
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @downvote = Downvote.find_by(
      user_id: current_user.id,
      review_id: @review.id
    )
    @beach = @review.beach
    @review.score += 1

    if @downvote.destroy && @review.save
      flash[:success] = "Downvote deleted successfully."
      redirect_to @beach
    else
      flash[:danger] = "Downvote not deleted."
      redirect_to @beach
    end
  end
end
