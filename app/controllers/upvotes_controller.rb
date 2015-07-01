class UpvotesController < ApplicationController
  def new
    @upvote = Upvote.new
    @review = Review.find(params[:review_id])
  end

  def create
    @review = Review.find(params[:review_id])
    @upvote = Upvote.new(upvote_params)
    @beach = @review.beach
    @upvote.review = @review
    @upvote.user = current_user
    if @upvote.save
      flash[:notice] = "Upvote added successfully."
      redirect_to @beach
    else
      flash[:notice] = "Upvote not added successfully."
      render :new
    end
  end

  def destroy
    @upvote = Upvote.find(params[:id])
    @beach = @upvote.review.beach
    if @upvote.destroy
      flash[:notice] = "Upvote deleted successfully."
      redirect_to @beach
    else
      flash[:notice] = "Upvote not deleted."
      redirect_to @beach
    end
  end

  private

  def upvote_params
    params.require(:upvote).permit(:value)
  end
end
