class RatingsController < ApplicationController

  before_action :redirect_if_not_logged_in

  def new
    @rating = Rating.new
  end
  
end
