Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      #Merchant Routes
      namespace :merchants do
        get '/find', to: 'search#show', as: :find_merchant
        get '/random', to: 'search#show', params: {random: true}
        get '/find_all', to: 'search#index', as: :find_merchants
        get '/most_revenue', to: 'most_revenue#index'
        get '/revenue', to: 'revenue#show'
        get '/most_items', to: 'most_items#index'
      end
      resources :merchants, :show do
        get '/invoices', to: 'merchants/invoices#index'
        get '/items', to: 'merchants/items#index'
        get '/revenue', to: 'merchants/revenue#show'
        get '/favorite_customer', to: 'merchants/favorite_customer#show'
      end
      resources :merchants, only: [:index]

      #Item Routes
      namespace :items do
        get '/most_revenue', to: 'most_revenue#index'
        get '/most_items', to: 'most_items#index'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
