Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end
  resources :users
  resources :posts
  root 'app#index'

  get 'posts/page/(:page(.:format))', to: 'posts#index'
  get 'users/page/(:page(.:format))', to: 'users#index'
  
  get 'app/index'
  get 'app/about'

  get "/users/auth/:provider/callback", to: "sessions#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
