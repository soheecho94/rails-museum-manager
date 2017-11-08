class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    @museums = Museum.all
    respond_to do |format|
      format.html { render :hello }
      format.json { render json: @museums }
    end
  end
end
