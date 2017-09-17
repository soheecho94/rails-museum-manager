require 'pry'

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

  def edit
    if params[:museum_id]
      @museum = Museum.find_by(id: params[:museum_id])
      if @museum.nil?
        redirect_to root_path, alert: "Museum Not Found"
      else
        @artwork = @museum.artworks.find_by(id: params[:id])
      end
    else
      @artwork = Artwork.find(params[:id])
    end
  end

  def update
    @museum = Museum.find_by(id: params[:artwork][:museum_id])
    @artwork = @museum.artworks.find_by(id: params[:id])
    if @artwork.update(artwork_params)
      redirect_to museum_artwork_path(@museum, @artwork)
    else
      render :edit
    end
  end

  private
    def artwork_params
      params.require(:artwork).permit(:title, :artist, :year, :description, :museum_id, category_ids:[], categories_attributes: [:name])
    end
end
