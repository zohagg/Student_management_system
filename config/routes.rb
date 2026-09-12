Rails.application.routes.draw do
  namespace :teachers do
    get "enrollments/index"
    get "enrollments/approve"
    get "enrollments/reject"
  end
  root to: "home#index"
  get "home/index"

  devise_for :users

  # Teacher namespace
 namespace :teacher do
    get 'dashboard', to: 'dashboards#teacher'

    resources :courses do
      resources :assignments
      resources :notes
    end
  end

  #   # Teacher enrollments namespace (RESTful)
  # namespace :teachers do
  #   resources :enrollments, only: [:index] do
  #     member do
  #       patch :approve
  #       patch :reject
  #     end
  #   end
  # end

  # Student namespace
  namespace :students do
    get "courses/index"
    get "courses/register"
    get 'dashboard', to: 'dashboard#index'
    get 'courses', to: 'courses#index'       # list available courses
    post 'courses/:id/register', to: 'courses#register', as: 'register_course'
  end

  # Recruiter dashboard
  get 'recruiter_dashboard', to: 'dashboards#recruiter'
end
