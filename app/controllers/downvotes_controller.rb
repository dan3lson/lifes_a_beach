class DownvotesController < ApplicationController

  def create
    if user_signed_in?
      @review = Review.find(params[:review_id])
      @beach = @review.beach
      @downvote = Downvote.new(
        review_id: @review.id,
        user_id: current_user.id
      )
      if @downvote.save
        flash[:notice] = "Downvote created successfully."
        respond_to do |format|
           format.html { review_path(@review) }
           format.json { render json: downvote }
        end
      else
        flash[:notice] = "Downvote not created successfully."
        render :new
      end
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @beach = @review.beach
    @downvote = Downvote.find_by(
      user_id: current_user.id,
      review_id: @review.id
    )
    if @downvote.destroy
      flash[:notice] = "Downvote deleted successfully."
      respond_to do |format|
         format.html { review_path(@review) }
         format.js { render json: downvote }
      end
    else
      flash[:notice] = "Downvote not deleted."
      redirect_to @beach
    end
  end

end
