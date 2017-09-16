class MuseumsController < ApplicationController
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
    @museum = Museum.find(params[:id])
  end

  def edit
    @museum = Museum.find(params[:id])
  end

  def update
    @museum = Museum.find(params[:id])
    if @museum.update(museum_params)
      redirect_to museum_path(@museum)
    else
      render :edit
    end
  end

  private
    def museum_params
      params.require(:museum).permit(:name, :description, :location_name, :location_id)
    end
end
