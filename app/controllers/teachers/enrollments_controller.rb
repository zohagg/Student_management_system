class Teachers::EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_teacher

  def index
    @pending_enrollments = Enrollment.joins(:course)
                                     .where(courses: { teacher_id: current_user.id }, status: "pending")
  end

  def approve
    enrollment = Enrollment.find(params[:id])
    enrollment.update(status: "approved")
    redirect_to teachers_enrollments_path, notice: "Enrollment approved."
  end

  def reject
    enrollment = Enrollment.find(params[:id])
    enrollment.update(status: "rejected")
    redirect_to teachers_enrollments_path, notice: "Enrollment rejected."
  end

  private

  def ensure_teacher
    redirect_to root_path, alert: "Access denied" unless current_user.teacher?
  end
end
