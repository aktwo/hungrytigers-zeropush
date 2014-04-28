class UsersController < ApplicationController
  def create
    begin
      User.create(user_params)
      render text: "1"
    rescue ActiveRecord::RecordNotUnique
      render text: "0"
    rescue Exception
      render text: "-1"
    end
  end

  private

  def user_params
    params.require(:user).permit(:device_token)
  end
end
