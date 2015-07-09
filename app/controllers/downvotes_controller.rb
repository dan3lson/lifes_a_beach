class DownvotesController < ApplicationController
  def create
    if user_signed_in?
      @review = Review.find(params[:review_id])
      @beach = @review.beach
      @downvote = Downvote.new(
        review_id: @review.id,
        user_id: current_user.id
      )
      respond_to do |format|
        if @downvote.save
          format.html { redirect_to :back,
                        notice: "Downvote created successfully."
          }
          format.json { render json: @downvote }
        else
          flash[:notice] = "Downvote not created successfully."
          format.html { redirect_to :back }
          format.json { render json: @downvote.errors,
                        status: :unprocessable_entity
          }
        end
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
        format.html { redirect_to :back }
        format.js { render json: @downvote }
      end
    else
      flash[:notice] = "Downvote not deleted."
      redirect_to @beach
    end
  end
end
