class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :verified_request?
  def verified_request?
    if request.content_type == "application/json"
      true
    else
      super()
    end
  end

  protect_from_forgery with: :exception

end
