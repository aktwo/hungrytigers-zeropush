require 'zero_push'

class UsersController < ApplicationController
  def create
    if User.create(user_params)
      render nothing: true, status: 200
    else
      render nothing: true, status: 500
    end
  end

  private

  def user_params
    params.require(:user).permit(:device_token)
  end
end
