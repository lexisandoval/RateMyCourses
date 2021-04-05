class CoursesController < ApplicationController

  before_action :redirect_if_not_logged_in

  def index
    redirect_to new_course_path
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find_by(id: params[:id])
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:message] = "Course was successfully added."
      redirect_to new_user_rating_path(current_user)
    else
      render :new
    end
  end

  private

  def course_params
    params.require(:course).permit(:number, :title, :description, :subject_id)
  end

end
