class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def get_current
    render json: current_user
  end
end
