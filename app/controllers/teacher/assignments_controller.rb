class Teacher::AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_teacher
  before_action :set_course
  
before_action :set_assignment, only: [:show, :edit, :update, :destroy]


def show
end


  def index
    @assignments = @course.assignments
  end

  def new
    @assignment = @course.assignments.build
  end


  def destroy
  @assignment.destroy
  redirect_to teacher_course_path(@course), 
              notice: "Assignment deleted successfully.",
              status: :see_other
end


  def create
    @assignment = @course.assignments.build(assignment_params)
    if @assignment.save
      redirect_to teacher_course_path(@course), notice: "Assignment created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @assignment.update(assignment_params)
      redirect_to teacher_course_path(@course), notice: "Assignment updated successfully."
    else
      render :edit
    end
  end





  private

  def set_course
    @course = current_user.courses.find(params[:course_id])
  end

  def set_assignment
    @assignment = @course.assignments.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:title, :description, files: [])
  end

  def ensure_teacher
    redirect_to root_path, alert: "Access denied" unless current_user.teacher?
  end
end
