class BeachesController < ApplicationController
  def new
    @beach = Beach.new
  end

  def create
    @beach = Beach.new(beach_params)
    @beach.user = current_user
    if @beach.save
      flash[:notice] = "Beach created successfully."
      redirect_to beaches_path
    else
      flash.now[:notice] = "Beach not created successfully."
      render :new
    end
  end

  def index
    @beaches = Beach.all
  end

  def show
    @beach = Beach.find(params[:id])
  end

  def edit
    @beach = Beach.find(params[:id])
  end

  def update
    @user = current_user
    @beach = Beach.find(params[:id])
    @beach.user = @user
    if @beach.update(beach_params)
      flash[:notice] = "Beach updated successfully."
      redirect_to beach_path(@beach)
    else
      flash.now[:notice] = "Beach not updated successfully."
      render :edit
    end
  end

  def destroy
    @beach = Beach.find(params[:id])
    if @beach.destroy
      flash[:success] = "Beach deleted successfully."
      redirect_to beaches_path
    else
      flash.now[:danger] = "Beach not deleted."
      redirect_to beach_path(@beach)
    end
  end

  private
  def beach_params
    params.require(:beach).permit(
      :name,
      :description,
      :street1,
      :street2,
      :city,
      :state,
      :zip,
      :entrance_fee,
      :picture_url
    )
  end
end
