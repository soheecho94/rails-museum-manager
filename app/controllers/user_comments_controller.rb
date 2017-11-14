class UserCommentsController < ApplicationController
  before_action :artwork_var, only: [:create, :update, :destroy]
  before_action :comments_var, only: [:edit, :update, :destroy]

  def index
    @comments = UserComment.all
    render json: @comments
  end

  def new
    @comments = UserComment.new(artwork_id: params[:artwork_id], user_id: current_user.id)
  end

  def create
    @comments = UserComment.new(artwork_id: @artwork.id, user_id: current_user.id, comments: params[:user_comment][:comments])
    if @comments.save
      redirect_to museum_artwork_path(artwork_var.museum, artwork_var)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if comments_var.update(comments: params[:user_comment][:comments])
      redirect_to museum_artwork_path(artwork_var.museum, artwork_var)
    else
      render :edit
    end
  end

  def destroy
    comments_var.destroy
    redirect_to museum_artwork_path(artwork_var.museum, artwork_var)
  end

  private
    def comments_var
      @comments = UserComment.find_by(id: params[:id])
    end

    def artwork_var
      @artwork = Artwork.find_by(id: params[:artwork_id])
    end
end
