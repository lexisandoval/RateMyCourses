class RatingsController < ApplicationController

  before_action :redirect_if_not_logged_in
  skip_before_action :redirect_if_not_logged_in, only: [:preview]

  def index
    # if user clicks the filter button, filter by course name
    if params[:rating] && params[:rating][:course_id]
      if params[:rating][:course_id] == ''
        @ratings= Rating.all
      else
        @ratings = Rating.filter(params[:rating][:course_id])
      end
    # otherwise show all the ratings
    else
      @ratings = Rating.all
    end
  end

  def new
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @rating = @user.ratings.build
    else 
      @rating = Rating.new
    end
  end

  def create
    @rating = current_user.ratings.build(rating_params)
    if @rating.save
      flash[:message] = "Rating was successfully added."
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
    @rating = Rating.find_by(id: params[:id])
    redirect_if_not_authorized(@rating)
  end

  def edit
    @rating = Rating.find_by(id: params[:id])
    redirect_if_not_authorized(@rating)
  end 

  def update
    @rating = Rating.find_by(id: params[:id])
    redirect_if_not_authorized(@rating)

    if @rating.update(rating_params)
      flash[:message] = "Rating was successfully updated."
      redirect_to rating_path(@rating)
    else
     render :edit
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy

    flash[:message] = "Rating was successfully deleted."
    redirect_to ratings_path
  end

  def preview
    @ratings= Rating.all.limit(3)
  end

  private

  def rating_params
    params.require(:rating).permit(:stars, :content, :course_id)
  end
  
end
