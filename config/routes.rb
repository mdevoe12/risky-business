Rails.application.routes.draw do
  root to: 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'dashboard#show'

  namespace :api do
    namespace :v1 do
      namespace :workers do
        resources :flras, only: [:create]
        get '/:id/task_scores', to: 'task_scores#index'
        get '/:id/flra-counts', to: 'form_counts#index'
        get '/:id/average', to: 'average#show'
      end

      namespace :supervisors, only: [] do
        get '/:id/task_scores', to: 'task_scores#index'
        get '/:id/flra-counts', to: 'form_counts#index'
      end

      namespace :supervisors do
        get '/flras/:worker_id', to: 'flras#index'
        get '/flra/:id', to: 'flras#show'
        put '/flras/:id', to: 'flras#update'
      end
      namespace :categories do
        get '/:id/risks', to: 'risks#index'
        post '/:id/risks', to: 'risks#create'
        get '/:id/controls', to: 'controls#index'
        post '/:id/controls', to: 'controls#create'
        get '/:id/risk_responses', to: 'risk_responses#index'
      end
      namespace :managers do
        resources :dashboard
      end
      resources :flras, only: :update
    end
  end

  get '/followups', to: 'followups#index'

  get '/insights', to: 'insights#index'
  resources :workers, only: [:index, :show]
  resources :categories, only: [:edit, :update]

  get '/support', to: 'support#index'
  get '/tasks', to: 'tasks#index'
  resources :flras, only: [:show, :update]
end
