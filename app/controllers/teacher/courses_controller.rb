module Teacher
  class CoursesController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_teacher!
    before_action :set_course, only: [:show, :edit, :update, :destroy]

    def index
      @courses = current_user.courses
    end

    def show
      @assignments = @course.assignments
      @notes = @course.notes
    end

    def new
      @course = current_user.courses.build
    end

    def create
      @course = current_user.courses.build(course_params)
      if @course.save
        redirect_to teacher_courses_path, notice: "Course created successfully!"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @course.update(course_params)
        redirect_to teacher_courses_path, notice: "Course updated successfully."
      else
        render :edit
      end
    end

    def destroy
      @course.destroy
      redirect_to teacher_courses_path, notice: "Course deleted successfully."
    end

    private

    def authorize_teacher!
      redirect_to root_path, alert: "Access denied." unless current_user.teacher?
    end

    def set_course
      @course = current_user.courses.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :description)
    end
  end
end
