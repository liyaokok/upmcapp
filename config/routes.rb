Rails.application.routes.draw do
  get "about-us", to: "about#index", as: :about

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "profile", to: "profiles#new"
  patch "profile", to: "profiles#update"

  get "employee", to: "employees#new"

  get "employee/profile/:id", to: "employee_profiles#new", as: :employee_profile
  patch "employee/profile/:id", to: "employee_profiles#update"
  
  get "employee/add", to: "employee_adds#new"

  root to: "main#index"
end
