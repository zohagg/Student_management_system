class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
   

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
 devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :roll_no, :department, :date_of_admission])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :roll_no, :department, :date_of_admission])
  end

  def after_sign_in_path_for(resource)
  case resource.role
  when 'student'
    students_dashboard_path
  when 'teacher'
    teacher_dashboard_path
  when 'recruiter'
    recruiter_dashboard_path
  else
    root_path
  end
end


end
