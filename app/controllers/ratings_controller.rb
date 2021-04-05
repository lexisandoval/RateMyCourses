class RatingsController < ApplicationController

  before_action :redirect_if_not_logged_in

  def index

    if params[:rating] && params[:rating][:course_id]
      @ratings = Rating.filter(params[:rating][:course_id])
    else
      @ratings = Rating.all
    end

    if params[:rating][:course_id] == ''
      @ratings= Rating.all
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
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
    @rating = Rating.find_by(id: params[:id])
    redirect_to ratings_path if !@rating || @rating.user != current_user #add helper
  end

  def edit
    @rating = Rating.find_by(id: params[:id])
    redirect_to ratings_path if !@rating || @rating.user != current_user #add helper
  end 

  def update
    @rating = Rating.find_by(id: params[:id])
    redirect_to ratings_path if !@rating || @rating.user != current_user #add helper
    if @rating.update(rating_params)
     redirect_to rating_path(@rating)
    else
     render :edit
   end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to ratings_path
  end

  private

  def rating_params
    params.require(:rating).permit(:stars, :content, :course_id)
  end
  
end
