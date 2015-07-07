class UpvotesController < ApplicationController

  def create
    if user_signed_in?
      @review = Review.find(params[:review_id])
      @beach = @review.beach
      @upvote = Upvote.new(
        review_id: @review.id,
        user_id: current_user.id
      )
      respond_to do |format|
        if @upvote.save
          format.html { redirect_to review_path(@review), notice: "Upvote created successfully." }
          format.json { render json: upvote }
        else
          flash[:notice] = "Upvote not created successfully."
          format.html { redirect_to review_path(@review) }
          format.json { render json: upvote.errors }
        end
      end
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @beach = @review.beach
    @upvote = Upvote.find_by(
      user_id: current_user.id,
      review_id: @review.id
     )
    if @upvote.destroy
      flash[:notice] = "Upvote deleted successfully."
      respond_to do |format|
         format.html { review_path(@review) }
         format.json { render json: upvote }
      end
    else
      flash[:notice] = "Upvote not deleted."
      redirect_to @beach
    end
  end

end
