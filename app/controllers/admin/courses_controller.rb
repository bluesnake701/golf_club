class Admin::CoursesController < ApplicationController
  def index
    @courses = Course.all.order(hole: :asc)
    @count = @courses.count
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.save
    redirect_to admin_course_path(@course.id)
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    @course.save
    redirect_to admin_course_path(@course.id)
  end

  private

  def course_params
    params.require(:course).permit(:hole, :par, :yard, :introduction)
  end
end
