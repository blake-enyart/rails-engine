Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#show', as: :find_merchant
        get '/find_all', to: 'search#index', as: :find_merchants
      end
      resources :merchants, only: [:show, :index]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
