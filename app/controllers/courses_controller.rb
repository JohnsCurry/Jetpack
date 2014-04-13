class CoursesController < ApplicationController

  def index
      @courses = Course.all.where(user_id: current_user)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.creator = current_user

    if @course.save
      flash[:notice] = "Your courses have been added"
      redirect_to courses_path
    end
  end

  def show
    @courses = Course.all.where(user_id: params[:id])
  end

private

  def course_params
    params.require(:course).permit!
  end

end