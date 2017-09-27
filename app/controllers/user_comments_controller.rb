class UserCommentsController < ApplicationController

  def new
    @comment = UserComment.new
  end

end
