class UserCommentsController < ApplicationController

  def new
    @comments = UserComment.new(artwork_id: params[:artwork_id], user_id: current_user.id)
  end

  def create
    @artwork = Artwork.find_by(id: params[:artwork_id])
    @comments = UserComment.new(artwork_id: @artwork.id, user_id: current_user.id, comments: params[:user_comment][:comments])
    if @comments.save
      redirect_to museum_artwork_path(@artwork.museum, @artwork)
    else
      render :new
    end
  end

end
