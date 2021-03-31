class CoursesController < ApplicationController

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to new_rating_path
    else
      render :new
    end
  end

  # def show
  #   redirect_if_not_logged_in
  #   @course = Course.find_by_id(params[:id])
  #   redirect_to '/' if !@user
  # end

  private

  def course_params
    params.require(:course).permit(:number, :title, :description)
  end

end
