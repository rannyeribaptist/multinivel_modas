Rails.application.routes.draw do
  resources :purchases
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root to: "users#dashboard", as: :user_dashboard

    get "concluir_cadastro", to: "users#finish_registration", as: :finish_registration

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
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get "/link/:number", to: "url_minifiers#redirect_url", as: :share_registration_code
end
