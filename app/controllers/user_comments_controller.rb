class UserCommentsController < ApplicationController

  def new
    @comments = UserComment.new
  end

  def create
    raise params.inspect
  end

end
