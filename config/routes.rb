Rails.application.routes.draw do
  root to: 'dashboard#show'
  namespace :api do
    namespace :v1 do
      namespace :workers do
        resources :tasks, only: [:create]

        get '/:id/average', to: 'average#show'
      end
      namespace :supervisors, only: [] do
        get '/:id/task_scores', to: 'task_scores#index'
      end
      namespace :supervisors do
        get '/flras/:worker_id', to: 'flras#index'
        put '/flras/:id', to: 'flras#update'
      end
    end
  end
  get '/followups', to: 'followups#index'

  get '/insights', to: 'insights#index'
  resources :workers, only: [:index, :show]

  get '/support', to: 'support#index'
  get '/tasks', to: 'tasks#index'
  resources :flras, only: [:show, :update]
end
