class ArtworksController < ApplicationController
  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def artwork_params
      params.require(:artwork).permit(:title, :artist, :year, :description)
    end
end
