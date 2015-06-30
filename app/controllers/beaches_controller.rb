class BeachesController < ApplicationController
  def show
    @beach = Beach.find(params[:id])
    @reviews = Review.where(beach_id: @beach.id)
  end
end
