class RatingsController < ApplicationController

  before_action :redirect_if_not_logged_in

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @ratings = @user.ratings
    else
      @ratings = Rating.all
    end
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = current_user.ratings.build(rating_params)
    @rating.course_id = 1
    if @rating.save
      redirect_to ratings_path
    else
      render :new
    end
  end

  def show
    @rating = Rating.find_by(id: params[:id])
  end

  private

  def rating_params
    params.require(:rating).permit(:stars, :content)
  end
  
end
