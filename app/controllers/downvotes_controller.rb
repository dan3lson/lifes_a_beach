class DownvotesController < ApplicationController
  def new
    @downvote = Downvote.new
  end

  def create
    @review = Review.find(params[:review_id])
    @downvote = Downvote.new(downvote_params)
    @beach = @review.beach
    @downvote.review = @review
    @downvote.user = current_user
    if @downvote.save
      flash[:notice] = "Downvote added successfully."
      redirect_to @beach
    else
      flash[:notice] = "Downvote not added successfully."
      render :new
    end
  end

  def destroy
    @downvote = Downvote.find(params[:id])
    @beach = @downvote.review.beach
    if @downvote.destroy
      flash[:notice] = "Downvote deleted successfully."
      redirect_to @beach
    else
      flash[:notice] = "Downvote not deleted."
      redirect_to @beach
    end
  end

  private

  def downvote_params
    params.require(:downvote).permit(:value)
  end
end
