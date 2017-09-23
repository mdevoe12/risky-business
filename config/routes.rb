Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :workers do
        resources :tasks, only: [:create]
      end
    end
  end


  resources :workers, only: [:index]

end
