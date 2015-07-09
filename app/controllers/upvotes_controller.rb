class UpvotesController < ApplicationController
  def create
    if user_signed_in?
      @review = Review.find(params[:review_id])
      @beach = @review.beach
      @upvote = Upvote.new(
        review_id: @review.id,
        user_id: current_user.id
      )
      @review.score += 1

      if @upvote.save && @review.save
        flash[:success] = "Upvote created successfully."
        redirect_to @beach
      else
        flash[:danger] = "Upvote not created successfully."
        render :new
      end
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @upvote = Upvote.find_by(user_id: current_user.id, review_id: @review.id)
    @beach = @review.beach
    @review.score -= 1

    if @upvote.destroy && @review.save
      flash[:success] = "Upvote deleted successfully."
      redirect_to @beach
    else
      flash[:danger] = "Upvote not deleted."
      redirect_to @beach
    end
  end
end
