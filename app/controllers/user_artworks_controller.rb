class UserArtworksController < ApplicationController

  def create
    userartwork = UserArtwork.find_or_create_by(artwork_id: params[:artwork_id], user_id: current_user.id)
    if userartwork
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end
end
