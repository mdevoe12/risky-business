Rails.application.routes.draw do
  root to: 'workers#index'
  namespace :api do
    namespace :v1 do
      namespace :workers do
        resources :tasks, only: [:create]

        get '/:id/average', to: 'average#show'
      end

      namespace :supervisors do
        get '/tasks/:worker_id', to: 'tasks#index'
        put '/tasks/:id', to: 'tasks#update'
      end
    end
  end

  resources :workers, only: [:index, :show]

  get '/support', to: 'support#index'
  get '/tasks', to: 'tasks#index'
end
