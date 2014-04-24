class ListingsController < ApplicationController
  def create
    if Listing.create(listing_params)
      render nothing: true, status: 200
    else
      render nothing: true, status: 500
    end
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
