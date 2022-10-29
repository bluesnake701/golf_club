class Public::CoursesController < ApplicationController
  def index
    @courses = Course.all.order(hole: :asc)
  end

  def show
    @course = Course.find(params[:id])
  end

   private

  def course_params
    params.require(:course).permit(:hole, :par, :yard, :introduction)
  end
end
