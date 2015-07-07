class BeachesController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    if params[:query] && params[:query].match(/^\s*$/)
      flash[:notice] = "Please enter one or more words to search."
      @beaches = Beach.all
    elsif params[:query]
      @beaches = Beach.search(params[:query])
    else
      @beaches = Beach.all
    end
  end

  def new
    @beach = Beach.new
    @amenities = Amenity.all_names
  end

  def create
    # Does everything in the new have to be defined in
    # the create action as well?
    @beach = Beach.new(beach_params)
    @beach.user = current_user
    @amenities = Amenity.all_names
    @amenity = Amenity.find_by(name: params[:amenities])
    @beach_amenity = BeachAmenity.new(beach: @beach, amenity: @amenity)
    if @beach.save && @beach_amenity.save
      flash[:notice] = "Beach created successfully."
      redirect_to @beach
    else
      flash.now[:notice] = "Beach not created successfully."
      render :new
    end
  end

  def show
    @beach = Beach.find(params[:id])
    @reviews = Review.where(beach_id: @beach.id)
  end

  def edit
    @amenities = Amenity.all_names
    @beach = Beach.find(params[:id])
  end

  def update
    @user = current_user
    @amenities = Amenity.all_names
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
    @beach_amenity = BeachAmenity.where(beach_id: @beach.id)
    if @beach.destroy && @beach_amenity.destroy_all
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

  def authorize_user
    if !user_signed_in? && current_user != Beach.find(params[:id]).user
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
