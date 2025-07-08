Rails.application.routes.draw do
  # Página inicial (login)
  root 'sessions#new'

  # Sessões (login/logout)
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Questionários (aluno)
  resources :questionnaires, only: [:index, :show]

  # Histórico do aluno
  get '/historico', to: 'users#show'

  # Área administrativa
  namespace :admin do
    get "dashboard/show"
    get '/dashboard', to: 'dashboard#show'
    resources :templates, only: [:new, :create, :edit, :update, :index]
    resources :answers, only: [:index]

  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
