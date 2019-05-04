Rails.application.routes.draw do
  namespace :api do
    #Merchant Routes
    namespace :v1 do
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
        get '/customers_with_pending_invoices', to: 'merchants/customers_with_pending_invoices#index'
      end
      resources :merchants, only: [:index]
    end

    #Customer Routes
    namespace :v1 do
      namespace :customers do
        get '/find', to: 'search#show', as: :find_customer
        get '/random', to: 'search#show', params: {random: true}
        get '/find_all', to: 'search#index', as: :find_customers
      end
      resources :customers, :show do
        get '/favorite_merchant', to: 'customers/favorite_merchant#show'
        get '/invoices', to: 'customers/invoices#index'
        get '/transactions', to: 'customers/transactions#index'
      end
      resources :customers, only: [:index]
    end

    #InvoiceItem Routes
    namespace :v1 do
      namespace :invoice_items do
        get '/find', to: 'search#show', as: :find_invoice_item
        get '/random', to: 'search#show', params: {random: true}
        get '/find_all', to: 'search#index', as: :find_invoice_items
      end
      resources :invoice_items, :show do
        get '/invoice', to: 'invoice_items/invoices#show'
        get '/item', to: 'invoice_items/items#show'
      end
      resources :invoice_items, only: [:index]
    end

    #Item Routes
    namespace :v1 do
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
    end

    #Invoice Routes
    namespace :v1 do
      namespace :invoices do
        get '/find', to: 'search#show', as: :find_invoice
        get '/random', to: 'search#show', params: {random: true}
        get '/find_all', to: 'search#index', as: :find_invoices
      end
      resources :invoices, :show do
        get '/transactions', to: 'invoices/transactions#index'
        get '/invoice_items', to: 'invoices/invoice_items#index'
        get '/items', to: 'invoices/items#index'
        get '/customer', to: 'invoices/customers#show'
        get '/merchant', to: 'invoices/merchants#show'
      end
      resources :invoices, only: [:index]
    end

    #Transaction Routes
    namespace :v1 do
      namespace :transactions do
        get '/find', to: 'search#show', as: :find_transaction
        get '/random', to: 'search#show', params: {random: true}
        get '/find_all', to: 'search#index', as: :find_transactions
      end
      resources :transactions, :show do
        get '/invoice', to: 'transactions/invoices#show'
      end
      resources :transactions, only: [:index]
    end
  end
end
