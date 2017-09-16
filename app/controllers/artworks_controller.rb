class ArtworksController < ApplicationController
  def new
    @artwork = Artwork.new(museum_id: params[:museum_id])
  end

  def create
    @museum = Museum.find_by(id: params[:artwork][:museum_id])
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      redirect_to museum_artwork_path(@museum, @artwork)
    else
      render :new
    end
  end

  def show
    if params[:museum_id]
      @museum = Museum.find_by(id: params[:museum_id])
      @artwork = @museum.artworks.find_by(id: params[:id])
    end
  end

  private
    def artwork_params
      params.require(:artwork).permit(:title, :artist, :year, :description, :museum_id)
    end
end
