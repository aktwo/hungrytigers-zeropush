class ListingsController < ApplicationController
  def create
    begin
      Listing.create(listing_params)
      User.notify("new listing")
      render json: {status: 1}
    rescue Exception
      render json: {status: 0}
    end
  end

  def update
    begin
      id = update_params[:id]
      old_status = Listing.find(id)[:status]
      update_status = update_params[:status]
      new_status = (update_status + old_status) / 2
      Listing.update(id, new_status)
      unless new_status.floor == old_status.floor
        User.notify({id: id, status: new_status.floor})
      end
      render json: {status: 1}
    rescue Exception
      render json: {status: 0}
    end
  end

  def generate
    subject = email_params[:subject]
    body = email_params[:body]
    debug = email_params[:debug]
    if ListingMailer.listing_email(subject, body, debug).deliver
      render json: {status: 1}
    else
      render json: {status: -1}
    end
  end

  def show_recent
    render json: Listing.last((params[:number] || 10).to_i).reverse
  end

  def show_by_id
    render json: Listing.find(params[:number].to_i)
  end

  private

  def listing_params
    params[:listing][:timestamp] = params[:listing][:timestamp].to_datetime
    params[:listing][:status] = 2
    params.require(:listing).permit(:name, :email, :subject, :body, :longitude, :latitude, :timestamp, :building, :status)
  end

  def update_params
    params.require(:update).permit(:id, :status)
  end

  def email_params
    params.require(:email).permit(:subject, :body, :debug, :name)
  end
end
