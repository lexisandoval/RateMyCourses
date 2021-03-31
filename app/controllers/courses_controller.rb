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

  private

  def course_params
    params.require(:course).permit(:number, :title, :description, :subject_id)
  end

end
