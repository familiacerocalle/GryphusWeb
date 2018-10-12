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
    end
  end

  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  # Crear los caminos para las nuevas vistas
  get 'course_users/show_disp'
  get 'course_users/show_act'
  get 'course_users/show_hist'
  get 'course_users/inscribir'
  get 'course_users/finalizar'

  get 'challenge_users/show_disp'
  get 'challenge_users/show_act'
  get 'challenge_users/show_hist'
  get 'challenge_users/inscribir'
  get 'challenge_users/finalizar'

  namespace 'api' do
    namespace 'v1' do
      resources :apisessions
      resources :apicourses
      resources :users
      get 'course_users/show_disp'
      get 'course_users/show_act'
      get 'course_users/show_hist'
      post 'course_users/inscribircurso'
      post 'course_users/finalizarcurso'
      post 'users/signup'
      post 'users/signin'
      get 'challenge_users/show_disp'
      get 'challenge_users/show_act'
      get 'challenge_users/show_hist'
      post 'challenge_users/inscribirreto'
      post 'challenge_users/finalizarreto'
      resources :complaint_users
      get 'complaint_users/show_hist'
      resources :complaintfiles
    end
  end
end
