Rails.application.routes.draw do
  resources :assemble_orders
  resources :starter_packs
  resources :user_starter_packs
  resources :purchase_orders
  resources :purchases
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root to: "users#dashboard", as: :user_dashboard

    get "concluir_cadastro", to: "users#finish_registration", as: :finish_registration
    get "concluir_assinatura", to: "users#validate_plan", as: :validate_plan

    resources :products
    resources :users
    resources :product_sizes
    resources :product_categories
    resources :shopping_carts

    get "meus_niveis", to: "users#user_levels", as: :user_levels
    get "store", to: "products#store", as: :store
    get "settings", to: "application#settings", as: :settings

    get "store/add_item/:product_id&:size", to: "shopping_carts#add_item", as: :add_item
    get "store/remove_item/:item_id", to: "shopping_carts#remove_item", as: :remove_item
    get "soon", to: "application#soon", as: :soon

    post "/processar_pagamento", to: "purchases#proccess_payment", as: :proccess_payment

    get "approve_products", to: "products#approve_products", as: :approve_products
    post "approve_product/:id", to: "products#approve_product", as: :approve_product

    get "/unauthorized_payments", to: "purchases#unauthorized_payments", as: :unauthorized_payments
    post "/authorize_payment/:id", to: "purchases#authorize_payment", as: :authorize_payment

    get "checkout_assemble/:id", to: "assembles#checkout_assemble", as: :checkout_assemble
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get "/link/:number", to: "url_minifiers#redirect_url", as: :share_registration_code
  post "/payment_hooks", to: "purchases#payment_hooks"
end
