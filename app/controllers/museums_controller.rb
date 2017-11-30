class MuseumsController < ApplicationController
  before_action :museum_var, only: [:show, :edit, :update, :destroy, :collection]

  def new
    @museum = Museum.new
  end

  def create
    @museum = Museum.new(museum_params)
    if @museum.save
      redirect_to museum_path(@museum)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @museum.update(museum_params)
      redirect_to museum_path(@museum)
    else
      render :edit
    end
  end

  def top
    @museums = Museum.most_artworks
  end

  def destroy
    @museum.destroy
    redirect_to root_path
  end

  def collection
    @artworks = @museum.artworks
    render json: @artworks
  end

  private
    def museum_params
      params.require(:museum).permit(:name, :description, :location_id, location_attributes: [:name])
    end

    def museum_var
      @museum = Museum.find(params[:id])
    end
end
