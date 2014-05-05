class UsersController < ApplicationController
  def create
    begin
      User.create(user_params)
      render json: {status: 1}
    rescue ActiveRecord::RecordNotUnique
      render json: {status: 0}
    rescue Exception
      render json: {status: -1}
    end
  end

  private

  def user_params
    params.require(:user).permit(:device_token)
  end
end
