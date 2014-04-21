class ListingsController < ApplicationController
  def create
    Listing.create(listing_params)
    User.notify
  end

  def show
    render json: Listing.last((params[:number] || 10).to_i).reverse
  end

  private

  def listing_params
    params[:listing][:timestamp] = params[:listing][:timestamp].to_datetime
    params.require(:listing).permit(:name, :email, :subject, :body, :longitude, :latitude, :timestamp)
  end
end
