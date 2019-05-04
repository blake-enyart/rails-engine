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
        get '/find', to: 'search#show', as: :find_item
        get '/random', to: 'search#show', params: {random: true}
        get '/find_all', to: 'search#index', as: :find_items
      end
      resources :items, :show do
        get '/best_day', to: 'items/best_day#show'
        get '/invoice_items', to: 'items/invoice_items#index'
        get '/merchant', to: 'items/merchants#show'
      end
      resources :items, only: [:index]

      #Customer Routes
      resources :customers, :show do
        get '/favorite_merchant', to: 'customers/favorite_merchant#show'
        get '/invoices', to: 'customers/invoices#index'
        get '/transactions', to: 'customers/transactions#index'
      end

      #Invoice Routes
      resources :invoices, :show do
        get '/transactions', to: 'invoices/transactions#index'
        get '/invoice_items', to: 'invoices/invoice_items#index'
        get '/items', to: 'invoices/items#index'
        get '/customer', to: 'invoices/customers#show'
        get '/merchant', to: 'invoices/merchants#show'
      end

      #InvoiceItem Routes
      resources :invoice_items, :show do
        get '/invoice', to: 'invoice_items/invoices#show'
        get '/item', to: 'invoice_items/items#show'
      end

      #Transaction Routes
      resources :transactions, :show do
        get '/invoice', to: 'transactions/invoices#show'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
