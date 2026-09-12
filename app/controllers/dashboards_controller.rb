module Teacher
  class DashboardsController < ApplicationController
    before_action :authenticate_user!  # optional if you want to restrict access

    def teacher
      # Fetch teacher-specific data here
      @courses = current_user.courses
    end
  end
end
