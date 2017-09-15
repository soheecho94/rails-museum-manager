class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    @museums = Museum.all
  end
end
