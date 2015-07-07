class BeachesController < ApplicationController
  before_action :set_beach, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, except: [:index, :show]
  respond_to :html, :json

  def new
    @beach = Beach.new
    @amenities = Amenity.all_names
  end

  def create
    @beach = Beach.new(beach_params)
    @beach.user = current_user
    @amenities = Amenity.all_names
    @amenity = Amenity.find_by(name: params[:amenities])
    @beach_amenity = BeachAmenity.new(beach: @beach, amenity: @amenity)
    if @beach.save && @beach_amenity.save
      flash[:notice] = "Beach created successfully."
    else
      flash[:notice] = "Beach not created successfully."
    end
    respond_with(@beach)
  end

  def index
    @beaches = Beach.all.page(params[:page]).per(10)
  end

  def show
    @reviews = Review.where(beach_id: @beach.id).page(params[:page]).per(2)
  end

  def edit
    @amenities = Amenity.all_names
  end

  def update
    @user = current_user
    @amenities = Amenity.all_names
    @beach.user = @user
    if @beach.update(beach_params)
      flash[:notice] = "Beach updated successfully."
    else
      flash[:notice] = "Beach not updated successfully."
    end
    respond_with(@beach)
  end

  def destroy
    @beach_amenity = BeachAmenity.where(beach_id: @beach.id)
    if @beach.destroy && @beach_amenity.destroy_all
      flash[:success] = "Beach deleted successfully."
    else
      flash.now[:danger] = "Beach not deleted."
    end
    respond_with(@beach)
  end

  private

  def set_beach
    @beach = Beach.find(params[:id])
  end

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

  def authorize_user
    if !user_signed_in? && current_user != Beach.find(params[:id]).user
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
