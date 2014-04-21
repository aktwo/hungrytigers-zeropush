require 'zero_push'

class UsersController < ApplicationController
  def create
    User.create(user_params)
  end

  private

  def listing_params
    params.require(:user).permit(:device_token)
  end
end
