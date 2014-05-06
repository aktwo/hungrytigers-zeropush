class UsersController < ApplicationController
  def create
    begin
      User.create(user_params)
      render json: {status: 1}
    rescue ActiveRecord::RecordNotUnique
      render json: {status: 0}
    rescue => e
      render json: {status: -1, exception: "#{e}"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:device_token)
  end
end
