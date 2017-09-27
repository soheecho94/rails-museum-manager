class UserCommentsController < ApplicationController

  def new
    @comments = UserComment.new(artwork_id: params[:artwork_id], user_id: current_user.id)
  end

  def create
    raise params.inspect
  end

end
