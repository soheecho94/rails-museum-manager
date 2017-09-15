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

  private
    def museum_params
      params.require(:museum).permit(:name, :description)
    end
end
