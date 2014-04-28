class ListingsController < ApplicationController
  def create
    begin
      Listing.create(listing_params)
      User.notify
      render text: "1"
    rescue Exception
      render text: "-1"
    end
  end

  def show
    render json: Listing.last((params[:number] || 10).to_i).reverse
  end

  private

  def listing_params
    params[:listing][:timestamp] = params[:listing][:timestamp].to_datetime
    params.require(:listing).permit(:name, :email, :subject, :body, :longitude, :latitude, :timestamp, :building)
  end
end
