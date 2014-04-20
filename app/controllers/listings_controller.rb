class ListingsController < ApplicationController

  def create
    Listing.create(listing_params)
  end

  private

  def listing_params
    params[:listing][:timestamp] = params[:listing][:timestamp].to_datetime
    params.require(:listing).permit(:name, :email, :subject, :body, :longitude, :latitude, :timestamp)
  end
end
