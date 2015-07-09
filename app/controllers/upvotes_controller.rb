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
          format.html do
            redirect_to :back,
            notice: "Upvote created successfully."
          end
          format.json { render json: @upvote }
        else
          flash[:notice] = "Upvote not created successfully."
          format.html { redirect_to :back }
          format.json do
            render json: @upvote.errors,
            status: :unprocessable_entity
          end
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
        format.html { redirect_to :back }
        format.json { render json: @upvote }
      end
    else
      flash[:notice] = "Upvote not deleted."
      redirect_to @beach
    end
  end
end
