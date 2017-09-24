Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :workers do
        resources :tasks, only: [:create]
      end
      namespace :supervisors, only: [] do
        get '/:id/task_scores', to: 'task_scores#show'
      end
    end
  end

  get '/insights', to: 'insights#index'


end
