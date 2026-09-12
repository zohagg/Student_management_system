class Students::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_student

  def index
  end

  private

  def ensure_student
    redirect_to root_path, alert: "Access denied" unless current_user.student?
  end
end
