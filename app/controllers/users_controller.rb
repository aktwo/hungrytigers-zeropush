class UsersController < ApplicationController
  def create
    render text: (User.create(user_params) ? "1" : "0")
  end

  private

  def user_params
    params.require(:user).permit(:device_token)
  end
end
