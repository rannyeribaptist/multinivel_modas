Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root to: "users#dashboard", as: :user_dashboard

    get "concluir_cadastro", to: "users#finish_registration", as: :finish_registration

    resources :products
    resources :users
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
