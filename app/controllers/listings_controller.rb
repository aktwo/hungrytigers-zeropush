class ListingsController < ApplicationController
  def create
    begin
      Listing.create(listing_params)
      User.notify({new_listing: ""})
      render json: {status: 1}
    rescue => e
      render json: {status: 0, exception: "#{e}"}
    end
  end

  def update
    begin
      id = update_params[:id].to_i
      listing = Listing.find(id)
      old_status = listing[:status]
      update_status = update_params[:status].to_i
      new_status = (update_status + old_status) / 2
      result = listing.update(status:new_status)
      unless new_status.round == old_status.round
        User.notify({id: id, status: new_status.round})
      end
      render json: {status: 1}
    rescue => e
      render json: {status: 0, exception: "#{e}"}
    end
  end

  def generate
    subject = email_params[:subject]
    body = email_params[:body]
    debug = email_params[:debug]
    name = email_params[:name]
    if ListingMailer.listing_email(subject, body, debug, name).deliver
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
