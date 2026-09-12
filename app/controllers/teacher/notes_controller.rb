class Teacher::NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_teacher
  before_action :set_course
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = @course.notes
  end

  def new
    @note = @course.notes.build
  end

  def create
    @note = @course.notes.build(note_params)
    if @note.save
      redirect_to teacher_course_path(@course), notice: "Note created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @note.update(note_params)
      redirect_to teacher_course_path(@course), notice: "Note updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to teacher_course_path(@course), notice: "Note deleted successfully.", status: :see_other
  end

  private

  def set_course
    @course = current_user.courses.find(params[:course_id])
  end

  def set_note
    @note = @course.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content, files: [])
  end

  def ensure_teacher
    redirect_to root_path, alert: "Access denied" unless current_user.teacher?
  end
end
