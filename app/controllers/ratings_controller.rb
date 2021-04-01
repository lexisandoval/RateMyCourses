class RatingsController < ApplicationController

  before_action :redirect_if_not_logged_in

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @ratings = @user.ratings
    else
      @error = "Unauthorized" if params[:user_id]
      @ratings = Rating.all
    end
    @ratings = @ratings.filter(params[:rating][:subject_id]) if params[:rating] && params[:rating][:subject_id] != ""
  end

  def new
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @rating = @user.ratings.build
    else 
      @error = "Unauthorized" if params[:user_id]
      @rating = Rating.new
    end
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

  def edit
    @rating = Rating.find_by(id: params[:id])
  end 

  def update
  end

  private

  def rating_params
    params.require(:rating).permit(:stars, :content, :subject_id, subject_attributes: [:name])
  end
  
end
