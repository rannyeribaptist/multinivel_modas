Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root to: "users#dashboard", as: :user_dashboard

    get "concluir_cadastro", to: "users#finish_registration", as: :finish_registration

    resources :products
    resources :users
    resources :product_sizes
    resources :product_categories

    get "meus_niveis", to: "users#user_levels", as: :user_levels
    get "store", to: "products#store", as: :store
    get "settings", to: "application#settings", as: :settings
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get "/link/:number", to: "url_minifiers#redirect_url", as: :share_registration_code
end
