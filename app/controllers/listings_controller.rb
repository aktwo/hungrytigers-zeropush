class ListingsController < ApplicationController
  def create
    begin
      Listing.create(listing_params)
      User.notify("new listing")
      render text: 1
    rescue Exception
      render text: 0
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
      render text: 1
    rescue Exception
      render text: 0
    end
  end

  def generate
    subject = email_params[:subject]
    body = email_params[:body]
    if ListingMailer.listing_email(subject, body).deliver
      render text: 1
    else
      render text: -1
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
    params.require(:email).permit(:subject, :body)
  end
end
