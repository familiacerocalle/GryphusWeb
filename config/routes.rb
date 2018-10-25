Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :complaintfiles

  # Se comenta la línea y se reemplaza por la siguiente para que no use "show"
  resources :complaint_users
  #get 'complaint_users/index'

  resources :complaints

  # Se comenta la línea y se reemplaza por la siguiente para que no use "show"
  #resources :challenge_users
  get 'challenge_users/index'

  resources :challenges
  resources :challengelevels

  # Se comenta la línea y se reemplaza por la siguiente para que no use "show"
  #resources :course_users
  get 'course_users/index'

  resources :courses
  devise_for :users, controllers: { sessions: 'sessions' }
  resources :users do
    member do
      get :unblock_resuest
      post :unblock
      get :unblock_me
    end
  end

  get 'home/index'
  get 'home/dashboard'

  authenticated :user do
    root 'home#dashboard', as: :authenticated_root
  end

  root 'home#index'

  # Crear los caminos para las nuevas vistas
  get 'course_users/show_disp'
  get 'course_users/show_act'
  get 'course_users/show_hist'
  get 'course_users/enroll'
  get 'course_users/finalizar'

  get 'challenge_users/show_disp'
  get 'challenge_users/show_act'
  get 'challenge_users/show_hist'
  get 'challenge_users/enroll'
  get 'challenge_users/finalizar'

  namespace 'api' do
    namespace 'v1' do
      resources :apisessions
      resources :apicourses
      resources :users, only: [:update]
      get 'course_users/show_disp'
      get 'course_users/show'
      get 'course_users/show_act'
      get 'course_users/show_hist'
      post 'course_users/inscribircurso'
      post 'course_users/finalizarcurso'
      post 'users/signup'
      post 'users/signin'
      delete 'users/sign_out'
      get 'challenge_users/show_disp'
      get 'challenge_users/show_act'
      get 'challenge_users/show'
      get 'challenge_users/show_hist'
      post 'challenge_users/inscribirreto'
      post 'challenge_users/finalizarreto'
      get 'complaints/complaint_types'
      resources :complaints, only: [:index, :create, :show, :update, :destroy]
      resources :complaintfiles, only: [:create, :update, :destroy]
    end
  end
end
