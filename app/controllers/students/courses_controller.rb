class Students::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_student

  def index
    # Courses student is NOT enrolled in
    @courses = Course.where.not(id: current_user.enrolled_courses.pluck(:id))
  end

  def register
    course = Course.find(params[:id])
    enrollment = current_user.enrollments.build(course: course, status: "pending")

    if enrollment.save
      redirect_to students_courses_path, notice: "Course registration requested. Wait for teacher approval."
    else
      redirect_to students_courses_path, alert: "Could not register for course."
    end
  end

  private

  def ensure_student
    redirect_to root_path, alert: "Access denied" unless current_user.student?
  end
end
