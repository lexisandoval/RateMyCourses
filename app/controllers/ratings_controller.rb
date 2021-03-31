class RatingsController < ApplicationController

  before_action :redirect_if_not_logged_in

  def new
    @rating = Rating.new
  end

  def create

  end

  private

  def rating_params
    params.require(:rating).permit(:stars, :content)
  end
  
end
